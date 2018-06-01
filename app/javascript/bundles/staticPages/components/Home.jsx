import React from 'react';

class Home extends React.Component {
    constructor(props){
        super(props);
    }
    render(){
        return(
            <div id="header">
                <h1>Is this working?</h1>
                {this.props.name}
            </div>
        )
    }
}

export default Home;
