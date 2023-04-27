import { useState } from "react";
import { CategoryForm } from "./CategoryForm";

export function EditCategory({}) {
    const [name, setName] = useState('');

    function onSubmit(e) {
        e.preventDefault();

        // TODO
    }

    return(
        <div id="page-content">
            <h1 className="text-center mt-4">Edit category</h1>
            <CategoryForm
                name={name}
                setName={setName}
                onSubmit={onSubmit}
            />
        </div>
    )
}
