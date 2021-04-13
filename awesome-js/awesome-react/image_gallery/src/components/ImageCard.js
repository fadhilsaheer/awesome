function ImageCard() {
    return (
        <div className="max-w-sm rounded overflow-hidden shadow-lg">
            <img src="https://source.unsplash.com/random" className="w-full" alt="awesome" />
            <div className="px-6 py-4">
                <div className="font-bold text-purple-500 text-xl mb-2">Photo by awesome</div>
                <ul>
                    <li><strong>Views: </strong>4000</li>
                    <li><strong>Downloads: </strong>300</li>
                    <li><strong>Likes: </strong>400</li>
                </ul>
            </div>
            <div className="px-6 py-4">
                <span className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2">
                    #hashtag
                </span>
                <span className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2">
                    #hashtag
                </span>
                <span className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2">
                    #hashtag
                </span>
            </div>
        </div>
    )
}

export default ImageCard
