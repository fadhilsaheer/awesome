import { Button, Icon } from 'semantic-ui-react';

const DeleteButton = ({ postId }) => {
    return (
        <Button as="div" color="red" floated="right">
            <Icon name="trash" style={{ margin: 0 }} />
        </Button>
    );
}

export default DeleteButton;