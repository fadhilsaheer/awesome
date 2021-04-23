import React, { useEffect, useRef } from 'react';
import Quill from 'quill';
import "quill/dist/quill.snow.css";

export default function TextEditor() {
    const wrapperRef = useRef();

    useEffect(() => {
        const editor = document.createElement('div');
        wrapperRef.current.append(editor);
        new Quill(editor, { theme: "snow" })
    }, []);

    return (
        <div id="container" ref={wrapperRef}></div>
    )
}
