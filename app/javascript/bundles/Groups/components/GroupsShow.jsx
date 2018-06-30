import React from 'react';

class GroupsShow extends React.Component{
    constructor(props){
        super(props);
    }

    render(){
        let memberNames = [];
        memberNames = this.props.members.map(member => {
            return<li key={member.id}> {member.name}</li>
        });

        return(
            <div>
                {this.props.group.name}
                <ul>
                    {memberNames}
                </ul>
            </div>
        )
    }
}

export default GroupsShow;


