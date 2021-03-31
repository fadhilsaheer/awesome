function deleteNote(noteId){
    fetch('/delete-note', {
        method: 'POST',
        body: JSON.stringify({ noteId })
    }).then((_res)=>{
       window.location.href = '/'
    })
}