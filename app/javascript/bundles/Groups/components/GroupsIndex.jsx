import React from 'react';

class GroupsIndex extends React.Component{
    constructor(props){
        super(props);

    }

    render(){
        return(
            <div>
                <h1>Trying this out</h1>
                {this.props.groups}
            </div>
        )
    }
}

export default GroupsIndex;
