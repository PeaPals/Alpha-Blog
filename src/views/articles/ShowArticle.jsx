import { Link } from "react-router-dom";
import { Card } from "../../components/card";

export function ShowArticle({
    title,
    description,
    username,
    userId,
    categories
}) {

    return (
        <div id="page-content">
            <h1 className="text-center mt-4">{title}</h1>
            <div className="container">
                <Card
                    cardHeader={`Created By : ${<><Link to={`/users/${userId}`} style={{textDecoration: "none"}}>{username}</Link></>} t seconds ago)`}
                    cardTitle={title}
                    cardText={`${description}<br />${categories && <><div className="mt-2">{categories}</div></>}`}
                    cardFooter={`Last Updated By : <%= link_to @article.user.username, user_path(@article.user), style: "text-decoration: none;" %> (<%= time_ago_in_words(@article.updated_at) %> ago)`}
                />

                <Link to="/articles" className="btn btn-outline-primary btn-lg btn-block col-12">Return</Link>
            </div>
        </div>
    )
}
