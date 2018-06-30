import React from 'react';

class GroupsIndex extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            showGroups: false
        }
    }

    showGroups = () => {
        var showing = this.state.showGroups;
        this.setState({
            showGroups: !showing,
        })
    }

    render(){

        let groupNames = null;
        if(this.props.groups && this.state.showGroups){
            groupNames = this.props.groups.map(g => {
                return <li key={g.id}><a href={"/groups/" + g.id}>{g.name}({g.identifier})</a></li>;
            });
        }

        return(
            <div>
                <h1>Trying this out</h1>
                <button onClick={this.showGroups}>My Groups</button>
                <ul>
                    {groupNames}
                </ul>
            </div>
        )
    }
}

export default GroupsIndex;
