import React,{ useState, useEffect } from 'react';
import ImageCard from './components/ImageCard';
import API_KEY from './env';

const apiKey = process.env.apiKey || API_KEY;


function App() {
    const [images, setImages] = useState([]);
    const [isLoading, setIsLoading] = useState(true);
    const [term, setTerm] = useState('');


    useEffect(()=>{
        fetch(`https://pixabay.com/api/?key=${apiKey}&q=${term}&image_type=photo&pretty=true`)
        .catch(err => console.log(err.message))
        .then(res => res.json())
        .then(data => {
            setImages(data.hits);
            setIsLoading(false);
        })
    }, [term]);

    return (
       <div className="container mx-auto">
           {isLoading 
           ? 
           <h1 className="text-6xl text-center mx-auto mt-32">Loading...</h1>
           : 
           <div className="grid grid-cols-3 gap-4">
                {images && images.map(image => (
                    <ImageCard key={image.id} image={image} />
                ))}
           </div>}
       </div> 
    );
}

export default App;