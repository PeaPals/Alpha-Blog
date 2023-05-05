import { useState } from "react";
import { ArticleForm } from "./ArticleForm";
import { useParams } from "react-router-dom";

export function EditArticle({}) {
  const id = useParams().id;
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");

  // TODO
  function onSubmit(e) {
    e.preventDefault();

    // TODO
  }

  return (
    <div id="page-content">
      <h1 className="text-center mt-4">Edit Article</h1>
      <ArticleForm
        categories={[]} // TODO
        title={title}
        setTitle={setTitle}
        description={description}
        setDescription={setDescription}
        onSubmit={onSubmit}
      />
    </div>
  );
}
