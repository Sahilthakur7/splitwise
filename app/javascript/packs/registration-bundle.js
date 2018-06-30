import ReactOnRails from 'react-on-rails';

import Home from '../bundles/staticPages/components/Home';

import GroupsIndex from '../bundles/Groups/components/GroupsIndex';

import GroupsShow from '../bundles/Groups/components/GroupsShow';

ReactOnRails.register({
    Home,
    GroupsIndex,
    GroupsShow,
});
