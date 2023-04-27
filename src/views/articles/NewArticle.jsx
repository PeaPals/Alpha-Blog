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
        <ArticleForm
            categories={[]}   // TODO
            title={title}
            setTitle={setTitle}
            description={description}
            setDescription={setDescription}
            onSubmit={onSubmit}
        />
    )
}
