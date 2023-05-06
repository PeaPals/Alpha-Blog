import { useEffect, useState } from "react";
import { ArticleForm } from "./ArticleForm";
import { useParams, useNavigate } from "react-router-dom";
import { Server } from "../../shared/helper";

export function EditArticle() {
  const id = useParams().id;
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [categoryIds, setCategoryIds] = useState([]);
  const [allCategories, setAllCategories] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    Server.get(`/articles/${id}`).then((response) => {
      const res = response.data;
      setTitle(res.article.title);
      setDescription(res.article.description);
      setCategoryIds(res.categories.map((category) => category.id));
    });

    Server.get("/categories").then((response) => {
      const categories = response.data.allCategories.map((obj) => ({
        id: obj.category.id,
        name: obj.category.name,
      }));
      setAllCategories(categories);
    });
  }, []);

  function onSubmit(e) {
    e.preventDefault();

    Server.patch(`/articles/${id}`, {
      article: {
        title: title,
        description: description,
      },
      category_ids: categoryIds,
    }).then((response) => {
      const articleId = response.data.article.id;
      navigate(`/articles/${articleId}`);
    });
  }

  return (
    <div id="page-content">
      <h1 className="text-center mt-4">Edit Article</h1>
      <ArticleForm
        categories={allCategories}
        title={title}
        setTitle={setTitle}
        description={description}
        setDescription={setDescription}
        categoryIds={categoryIds}
        setCategoryIds={setCategoryIds}
        onSubmit={onSubmit}
      />
    </div>
  );
}
