import React, { Component } from 'react';
import axios from 'axios'

import './FullPost.css';

class FullPost extends Component {
    state = {
        loadedPosts: { id: null }
    }
    componentDidUpdate() {
        if (!this.props.id) return;
        if (this.state.loadedPosts.id === this.props.id) return;
        axios({
            method: 'GET',
            url: `/posts/${this.props.id}`
        }).then(res => {
            this.setState({ loadedPosts: res.data })

        })
    }

    deletePostHandler = () => {
        axios.delete(`/posts/${this.props.id}`)
            .then(res =>
                console.log(res))
    }

    render() {
        let post = <p style={{ textAlign: 'center' }}>Please select a Post!</p>;
        if (!this.props.id) return post
        post = <p style={{ textAlign: 'center' }}>Loading...</p>
        if (!this.state.loadedPosts) return post
        post = (
            <div className="FullPost">
                <h1>{this.state.loadedPosts.title}</h1>
                <p>{this.state.loadedPosts.body}</p>
                <div className="Edit">
                    <button className="Delete" onClick={this.deletePostHandler}>Delete</button>
                </div>
            </div>
        );
        return post;
    }
}

export default FullPost;