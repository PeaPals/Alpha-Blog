import { SearchResultsItem } from './SearchItem';
import './shared.css';



export function SearchResultsView({searchResults}) {
    return (
        <div className="searched-results">
            <div className="container">

                {<>{
                    searchResults.map(
                        ({title, link, label, badge, assetLink}) => <SearchResultsItem itemTitle={title} itemLink={link} itemLabel={label} itemBadge={badge} itemAssetLink={assetLink} />
                    )
                }</>}


                {
                    !searchResults.length && <>
                        <div className="card p-2 mb-1 bg-transparent" id="searched-item">
                            <div className="card-body">
                                <h5 className="card-title text-warning">Such Empty</h5>
                                <small><span className="text-secondary">Try using some other searchphrase...</span></small>
                            </div>
                        </div>
                    </>
                }

                <div className="card p-2 mb-1 bg-transparent"></div>
            </div>
        </div>
    )
}
