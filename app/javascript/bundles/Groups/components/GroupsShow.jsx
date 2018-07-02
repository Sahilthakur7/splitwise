import React from 'react';

class GroupsShow extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            showEntryForm : false,
            totalSpent: this.props.group.total_spent

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

    handleInputSubmit = (e) => {
        var tempSpent = parseFloat(this.state.totalSpent);
        this.setState({
            totalSpent: parseFloat(tempSpent) + parseFloat(e.target.value)
        })
    }


    render(){
        let memberNames = [];
        let entryForm = null;
        memberNames = this.props.members.map(member => {
            return<li key={member.id}> {member.name}</li>
        });


        if(this.state.showEntryForm){

            entryForm =<form onSubmit={this.handleInputSubmit}> <input value={this.state.entry} type="number"></input></form>;
        }

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


