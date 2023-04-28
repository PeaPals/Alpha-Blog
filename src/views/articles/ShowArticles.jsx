import { GridView } from "../../components/gridview";
import { ArticleCard } from "./ArticleCard";

export function ShowArticles() {
  const allArticles = [];

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
