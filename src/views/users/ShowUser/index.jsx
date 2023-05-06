import { useEffect, useState } from "react";
import { UserCard } from "./UserCard";
import { UserControls } from "./UserControls";
import { useSearchParams, useParams } from "react-router-dom";
import { Server } from "../../../shared/helper";
import { GridView } from "../../../components/gridview";
import { ArticleCard } from "../../articles/ArticleCard";

export function ShowUser({}) {
  const id = useParams().id;
  const [object, setObject] = useState({
    user: {},
    articles: [],
    followers: [],
    followings: [],
  });

  const [searchParams] = useSearchParams();
  let param = searchParams.get("show");

  const gender = id % 2 ? "male" : "female";

  useEffect(() => {
    if (!param) {
      param = "";
    } else {
      param = `?show=${param}`;
    }
    Server.get(`/users/${id}` + param).then((response) => {
      setObject(response.data);
      console.log(object);
    });
  }, [id, param]);

  return (
    <div className="container">
      <div className="main-body" style={{ marginTop: "50px" }}>
        <div className="row gutters-sm">
          <div className="col-md-4 mb-3">
            <UserCard id={id} gender={gender} username={object.user.username} />

            <UserControls
              id={id}
              userEmail={object.user.email}
              joinedAgo={object.createdAt}
              totalArticles={object.totalArticles}
              totalFollowers={object.totalFollowers}
              totalFollowings={object.totalFollowing}
            />
          </div>

          <div className="col-md-8 shadow-lg p-3 mb-5 bg-white rounded">
            <h2 className="text-center mt-4">{param || "Articles"}</h2>
            <br />

            <GridView columns={2}>
              {object.articles.map((obj) => (
                <div className="col" key={obj.article.id}>
                  <ArticleCard
                    article={obj.article}
                    user={obj.user}
                    categories={obj.categories}
                    createdAt={obj.createdAt}
                    updatedAt={obj.updatedAt}
                    key={obj.article.id}
                  />
                </div>
              ))}

              {object.followers.map((obj) => (
                <div className="col" key={obj.user.id}>
                  <UserCard
                    user={obj.user}
                    totalArticles={obj.totalArticles}
                    totalFollowers={obj.totalFollowers}
                    totalFollowing={obj.totalFollowing}
                    createdAt={obj.createdAt}
                    isFollowing={obj.isFollowing}
                    followBack={obj.followBack}
                    key={obj.user.id}
                  />
                </div>
              ))}

              {object.followings.map((obj) => (
                <div className="col" key={obj.user.id}>
                  <UserCard
                    user={obj.user}
                    totalArticles={obj.totalArticles}
                    totalFollowers={obj.totalFollowers}
                    totalFollowing={obj.totalFollowing}
                    createdAt={obj.createdAt}
                    isFollowing={obj.isFollowing}
                    followBack={obj.followBack}
                    key={obj.user.id}
                  />
                </div>
              ))}
            </GridView>
          </div>
        </div>
      </div>
    </div>
  );
}
