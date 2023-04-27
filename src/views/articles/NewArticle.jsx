import { useState } from "react";
import { ArticleForm } from "./ArticleForm";

export function NewArticle({}) {
    const [title, setTitle] = useState('');
    const [description, setDescription] = useState('');

    function onSubmit(e) {
        e.preventDefault();

        // TODO
    }

    return(
        <div id="page-content">
            <h1 className="text-center mt-4">Create New Article</h1>
            <ArticleForm
                categories={[]}   // TODO
                title={title}
                setTitle={setTitle}
                description={description}
                setDescription={setDescription}
                onSubmit={onSubmit}
            />
        </div>
    )
}
