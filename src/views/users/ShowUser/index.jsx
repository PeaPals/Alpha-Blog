import { UserCard } from "./UserCard";
import { UserControls } from "./UserControls";
import { useSearchParams, useParams } from "react-router-dom";

export function ShowUser({}) {
  const params = useParams();
  const [searchParams] = useSearchParams();

  const username = "TODO";
  const showQueryParam = searchParams.get("show");
  const gender = "male" ? params.id % 2 : "female";
  const assetPath = "../../assets/images/user-logo.png";

  return (
    <div className="container">
      <div className="main-body" style={{ marginTop: "50px" }}>
        <div className="row gutters-sm">
          <div className="col-md-4 mb-3">
            <UserCard
              id={params.id}
              gender={gender}
              assetPath={assetPath}
              username={username}
            />

            <UserControls
              id={params.id}
              userEmail="example@example.com"
              joinedAgo="100 days ago"
              totalArticles={34}
              totalFollowers={123}
              totalFollowings={112}
            />
          </div>

          <div className="col-md-8 shadow-lg p-3 mb-5 bg-white rounded">
            <h2 className="text-center mt-4">{showQueryParam || "Articles"}</h2>
            {/* TODO : show articles / followers / followings here */}
          </div>
        </div>
      </div>
    </div>
  );
}
