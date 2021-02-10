// theme and text editor css
import 'codemirror/lib/codemirror.css';
import 'codemirror/theme/material.css';
// languages
import 'codemirror/mode/xml/xml';
import 'codemirror/mode/css/css';
import 'codemirror/mode/javascript/javascript';

import { Controlled as ControlledEditor } from 'react-codemirror2'; // for using code mirror in react
import { useState } from 'react';

// icons
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faCompressAlt, faExpandAlt } from '@fortawesome/free-solid-svg-icons'

const Editor = (props) => {

    const {
        displayName, 
        language, 
        value,
        onChange
    } = props

    const [open, setOpen] = useState(true);

    const handleChange = (editor, data, value) => {
        onChange(value)
    }

    return (
        <div className={`editor-container ${open ? '' : 'collapsed'}`}>
            <div className="editor-title">
                { displayName }
                <button 
                    type="button"
                    className="expand-collapse-btn"
                    onClick={()=>{
                        setOpen(prev => !prev)
                    }}
                >
                    <FontAwesomeIcon icon={open ? faCompressAlt : faExpandAlt } />
                </button>
            </div>
            <ControlledEditor
                onBeforeChange={handleChange}
                value={value}
                className="code-mirror-wrapper"
                options={{
                    lineWrapping: true,
                    lint: true,
                    mode: language,
                    theme: 'material',
                    lineNumbers: true,
                }}
            />
        </div>
    );
}
 
export default Editor;