{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.Redshift.DeleteClusterSecurityGroup
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- | Deletes an Amazon Redshift security group.
--
-- You cannot delete a security group that is associated with any clusters.
-- You cannot delete the default security group.
--
-- For information about managing security groups, go to
-- <http://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html Amazon Redshift Cluster Security Groups>
-- in the /Amazon Redshift Cluster Management Guide/.
--
-- <http://docs.aws.amazon.com/redshift/latest/APIReference/API_DeleteClusterSecurityGroup.html>
module Network.AWS.Redshift.DeleteClusterSecurityGroup
    (
    -- * Request
      DeleteClusterSecurityGroup
    -- ** Request constructor
    , deleteClusterSecurityGroup
    -- ** Request lenses
    , delClusterSecurityGroupName

    -- * Response
    , DeleteClusterSecurityGroupResponse
    -- ** Response constructor
    , deleteClusterSecurityGroupResponse
    ) where

import Network.AWS.Prelude
import Network.AWS.Redshift.Types
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteClusterSecurityGroup' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'delClusterSecurityGroupName'
newtype DeleteClusterSecurityGroup = DeleteClusterSecurityGroup'{_delClusterSecurityGroupName :: Text} deriving (Eq, Read, Show)

-- | 'DeleteClusterSecurityGroup' smart constructor.
deleteClusterSecurityGroup :: Text -> DeleteClusterSecurityGroup
deleteClusterSecurityGroup pClusterSecurityGroupName = DeleteClusterSecurityGroup'{_delClusterSecurityGroupName = pClusterSecurityGroupName};

-- | The name of the cluster security group to be deleted.
delClusterSecurityGroupName :: Lens' DeleteClusterSecurityGroup Text
delClusterSecurityGroupName = lens _delClusterSecurityGroupName (\ s a -> s{_delClusterSecurityGroupName = a});

instance AWSPager A where
        page rq rs
          | stop True = Nothing
          | otherwise = Just

instance AWSRequest DeleteClusterSecurityGroup where
        type Sv DeleteClusterSecurityGroup = Redshift
        type Rs DeleteClusterSecurityGroup =
             DeleteClusterSecurityGroupResponse
        request = post
        response
          = receiveNull DeleteClusterSecurityGroupResponse'

instance ToHeaders DeleteClusterSecurityGroup where
        toHeaders = const mempty

instance ToPath DeleteClusterSecurityGroup where
        toPath = const "/"

instance ToQuery DeleteClusterSecurityGroup where
        toQuery DeleteClusterSecurityGroup'{..}
          = mconcat
              ["Action" =:
                 ("DeleteClusterSecurityGroup" :: ByteString),
               "Version" =: ("2012-12-01" :: ByteString),
               "ClusterSecurityGroupName" =:
                 _delClusterSecurityGroupName]

-- | /See:/ 'deleteClusterSecurityGroupResponse' smart constructor.
data DeleteClusterSecurityGroupResponse = DeleteClusterSecurityGroupResponse' deriving (Eq, Read, Show)

-- | 'DeleteClusterSecurityGroupResponse' smart constructor.
deleteClusterSecurityGroupResponse :: DeleteClusterSecurityGroupResponse
deleteClusterSecurityGroupResponse = DeleteClusterSecurityGroupResponse';
