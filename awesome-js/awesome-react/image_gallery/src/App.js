import React,{ useState, useEffect } from 'react';
import ImageCard from './components/ImageCard';
import ImageSearch from './components/ImageSearch';
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
           <ImageSearch searchText={(text)=> setTerm(text)} />
           {!isLoading && images.length === 0 && (
                <h1 className="text-5xl text-center mx-auto mt-32">No images found with <span className="text-green-500">{term}</span></h1>
            )}
           {isLoading ? <h1 className="text-6xl text-center mx-auto mt-32">Loading...</h1> : 
           <div className="grid grid-cols-3 gap-4">
                {images && images.map(image => (
                    <ImageCard key={image.id} image={image} />
                ))}
           </div>}
       </div> 
    );
}

export default App;