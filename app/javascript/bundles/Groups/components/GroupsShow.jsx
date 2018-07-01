import React from 'react';

class GroupsShow extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            showEntryForm : false
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

        let totalSpent = 0;

        if(this.props.group.total_spent){
            totalSpent = this.props.group.total_spent;
        }

        if(this.state.showEntryForm){
            entryForm = <input></input>;
        }

        return(
            <div>
                {this.props.group.name} Total Spent - {totalSpent} 
                <ul>
                    {memberNames}
                </ul>
                <div>
                    <button onClick={this.showEntryForm}>Make an entry</button>
                    {entryForm}
                </div>
            </div>
        )
    }
}

export default GroupsShow;


