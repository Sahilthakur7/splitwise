import React from 'react';

class Home extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            count: 0
        }

    }


    onPictureHandler = () => {
        this.setState({
            count: this.state.count +1
        })
    }

    render(){
        return(
            <div id="header">
                <h1>Is this working?</h1>
                {this.props.name}
                <p><img src = {this.props.avatar} onClick={this.onPictureHandler}></img>
                </p>
                This image has been clicked {this.state.count} times.
            </div>
        )
    }
}

export default Home;
