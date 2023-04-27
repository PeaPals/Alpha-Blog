import { useState } from "react";
import { CategoryForm } from "./CategoryForm";

export function NewCategory({}) {
    const [name, setName] = useState('');

    function onSubmit(e) {
        e.preventDefault();

        // TODO
    }

    return(
        <div id="page-content">
            <h1 class="text-center mt-4">Create a new category</h1>
            <CategoryForm
                name={name}
                setName={setName}
                onSubmit={onSubmit}
            />
        </div>
    )
}
