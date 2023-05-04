import { SearchResultsItem } from "./SearchItem";
import "./shared.css";
import { useEffect, useState } from "react";
import { Server } from "../../shared/helper";

export function SearchResultsView({ querySearchphrase }) {
  const [searchresults, setSearchresults] = useState([]);

  useEffect(() => {
    Server.get(`/?searchphrase=${querySearchphrase}`).then((response) => {
      const results = response.data.searchResults;

      results["users"] = results["users"].map(({ id, username }) => ({
        title: username,
        link: `/users/${id}`,
        label: "user",
        badge: "primary",
        assetLink: undefined,
      }));

      results["articles"] = results["articles"].map(({ id, title }) => ({
        title: title,
        link: `/articles/${id}`,
        label: "article",
        badge: "warning",
        assetLink: undefined,
      }));

      results["categories"] = results["categories"].map(({ id, name }) => ({
        title: name,
        link: `/categories/${id}`,
        label: "category",
        badge: "danger",
        assetLink: undefined,
      }));

      setSearchresults(
        results["users"].concat(results["articles"], results["categories"])
      );
    });
  }, [querySearchphrase]);

  console.log(searchresults);

  return (
    searchresults && (
      <>
        <div className="searched-results">
          <div className="container">
            {
              <>
                {searchresults.map(
                  ({ title, link, label, badge, assetLink }) => (
                    <SearchResultsItem
                      itemTitle={title}
                      itemLink={link}
                      itemLabel={label}
                      itemBadge={badge}
                      itemAssetLink={assetLink}
                      key={title}
                    />
                  )
                )}
              </>
            }

            {!searchresults.length && (
              <>
                <div
                  className="card p-2 mb-1 bg-transparent"
                  id="searched-item"
                >
                  <div className="card-body">
                    <h5 className="card-title text-warning">Such Empty</h5>
                    <small>
                      <span className="text-secondary">
                        Try using some other searchphrase...
                      </span>
                    </small>
                  </div>
                </div>
              </>
            )}

            <div className="card p-2 mb-1 bg-transparent"></div>
          </div>
        </div>
      </>
    )
  );
}
