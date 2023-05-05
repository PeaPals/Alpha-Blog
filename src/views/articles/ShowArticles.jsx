import { useState, useEffect } from "react";
import { GridView } from "../../components/gridview";
import { ArticleCard } from "./ArticleCard";
import React from "react";
import { Server } from "../../shared/helper";

export function ShowArticles() {
  const [allArticles, setAllArticles] = useState([]);

  useEffect(() => {
    Server.get("/articles").then((response) => {
      setAllArticles(response.data.allArticles);
    });
  }, []);

  return (
    <div id="page-content">
      <h1 className="text-center mt-4">Listing Articles</h1>
      <br />

      <GridView columns={3}>
        {allArticles.map((object) => (
          <div className="col" key={object.article.id}>
            <ArticleCard
              article={object.article}
              user={object.user}
              categories={object.categories}
              createdAt={object.createdAt}
              updatedAt={object.updatedAt}
              key={object.article.id}
            />
          </div>
        ))}
      </GridView>
    </div>
  );
}
