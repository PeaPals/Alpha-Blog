import './shared.css';
import { Link } from 'react-router-dom';

export function NavBar({signedIn = false}) {
    return (
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <Link to="/" className='navbar-brand' id="logo">ALPHA ❄ BLOG</Link>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                    {(
                        signedIn && <>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="home-nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Articles</a>
                                <ul class="dropdown-menu">
                                    <li><Link to="/articles?show=my-feed" className="dropdown-item">My Feed</Link></li>
                                    <li><Link to="/articles" className="dropdown-item">View All Articles</Link></li>
                                    <li><Link to="/articles/new" className="dropdown-item">Create New Article</Link></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="home-nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Categories</a>
                                <ul class="dropdown-menu">
                                    <li><Link to="/categories" className="dropdown-item">View All Categories</Link></li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <Link to="/users" className="nav-link" id="home-nav-link">Bloggers</Link>
                            </li>

                            <li class="nav-item dropdown">
                                {/* TODO : replace username with current_user.username */}
                                <a class="nav-link dropdown-toggle" id="home-nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">username</a>
                                <ul class="dropdown-menu">
                                    {/* TODO : replace user_id with current_user.id */}
                                    <li><Link to="/users/user_id" className="dropdown-item">My Profile</Link></li>
                                    <li><Link to="edit_user_registration_path" className="dropdown-item">Edit Profile</Link></li>
                                    <li><Link to="destroy_user_session_path" className="dropdown-item">Logout</Link></li>
                                    <li><Link to="registration_path(current_user)" className="dropdown-item text-danger">Delete Profile</Link></li>
                                    {/* TODO : <li><%= link_to "Delete Profile", registration_path(current_user), data: { confirm: "Are you sure?", turbo_confirm: "Are you sure?" }, method: :delete, class: "dropdown-item text-danger" %> */}
                                </ul>
                            </li>

                            {/* TODO : <%= form_tag root_path, method: :get, class: 'd-flex form-group column', role: 'search' do %>
                                <%= text_field_tag :searchphrase, params[:searchphrase], placeholder: 'Search', class: 'form-control me-2 search-bar' %> */}
                        </>
                    )}


                    {/* TODO : replace true with is_signed_in() */}
                    {(
                        !signedIn && <>

                            <li class="nav-item">
                                <Link to="new_user_session_path" className="nav-link" id="home-nav-link">Login</Link>
                            </li>
                            <li class="nav-item">
                                <Link to="new_user_registration_path" className="nav-link" id="home-nav-link">Signup</Link>
                            </li>
                        </>
                    )}

                    </ul>
                </div>
            </div>
        </nav>
    )
}
