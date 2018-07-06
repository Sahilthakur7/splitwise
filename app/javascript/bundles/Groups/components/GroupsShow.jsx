import React from 'react';

class GroupsShow extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            showEntryForm : false,
            totalSpent: this.props.group.total_spent || 0

        }
    }

    showEntryForm = () => {
        var showing = this.state.showEntryForm;
        this.setState(
            {
                showEntryForm: !showing,
            }
        )
    }

    render(){
        let memberNames = [];
        let entryForm = null;
        memberNames = this.props.members.map(member => {
            return<li key={member.id}> {member.name}</li>
        });

        return(
            <div>
                {this.props.group.name} Total Spent - {this.state.totalSpent} 
                <ul>
                    {memberNames}
                </ul>
            </div>
        )
    }

}

export default GroupsShow;


