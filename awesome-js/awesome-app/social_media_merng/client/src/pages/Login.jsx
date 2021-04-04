import { useState, useContext } from 'react';
import { Button, Form } from 'semantic-ui-react';
import { useMutation } from '@apollo/client';
import { useForm } from '../utils/hook';
import { AuthContext } from '../context/auth';

import gql from 'graphql-tag';

const Login = (props) => {
    const context = useContext(AuthContext);
    const [errors, setErrors] = useState({});

    const { onChange, onSubmit, values } = useForm(loginUserCallback,  {
        username: '',
        password: ''
    })

    const [LoginUser, { loading }] = useMutation(LOGIN_USER, {
        variables: values,
        update(_, { data: { login: userData } }) {
            context.login(userData);
            props.history.push('/');
        },
        onError(err) {
            setErrors(err.graphQLErrors[0].extensions.exception.errors);
        }
    })

    function loginUserCallback(){
        LoginUser();
    }


    return (
        <div className="form-container">
            <Form onSubmit={onSubmit} noValidate className={loading ? "loading" : ""}>
                <h1>Login</h1>
                <Form.Input
                    type="text"
                    label="Username"
                    placeholder="Username..."
                    name="username"
                    value={values.username}
                    onChange={onChange}
                    error={errors.username ? true : false}
                />
                <Form.Input
                    type="password" 
                    label="password" 
                    placeholder="Password..." 
                    name="password" 
                    value={values.password} 
                    onChange={onChange}
                    error={errors.password ? true : false}
                />
                <Button type="submit" primary>Login</Button>
            </Form>
            {Object.keys(errors).length > 0 && (
                <div className="ui error message">
                    <ul className="list">
                        {Object.values(errors).map(value => (
                            <li key={value}>{value}</li>
                        ))}
                    </ul>
                </div>
            )}
        </div>
    );
}

const LOGIN_USER = gql`
    mutation login(
        $username: String!,
        $password: String!,
    ){ 
        login(
            username: $username password: $password,
        ){ 
            id
            email
            username
            token
        }
    }
`


export default Login;