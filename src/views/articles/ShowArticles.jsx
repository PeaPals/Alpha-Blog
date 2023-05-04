import { useState, useEffect } from "react";
import { GridView } from "../../components/gridview";
import { ArticleCard } from "./ArticleCard";
import React from "react";
import { Server } from "../../shared/helper";

export function ShowArticles() {
  const [allArticles, setAllArticles] = useState([]);

  useEffect(() => {
    Server.get("/articles").then((response) => {
      console.log(response);
      setAllArticles(response.data.allArticles);
    });
  }, []);

  return (
    <div id="page-content">
      <h1 className="text-center mt-4">Listing Articles</h1>
      <br />

      <GridView columns={3}>
        {allArticles.map((article) => (
          <div className="col" key={article.title}>
            <ArticleCard article={article} />
          </div>
        ))}
      </GridView>
    </div>
  );
}
