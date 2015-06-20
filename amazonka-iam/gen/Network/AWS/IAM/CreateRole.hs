{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.IAM.CreateRole
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

-- | Creates a new role for your AWS account. For more information about
-- roles, go to
-- <http://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html Working with Roles>.
-- For information about limitations on role names and the number of roles
-- you can create, go to
-- <http://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html Limitations on IAM Entities>
-- in the /Using IAM/ guide.
--
-- The policy in the following example grants permission to an EC2 instance
-- to assume the role.
--
-- <http://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html>
module Network.AWS.IAM.CreateRole
    (
    -- * Request
      CreateRole
    -- ** Request constructor
    , createRole
    -- ** Request lenses
    , crPath
    , crRoleName
    , crAssumeRolePolicyDocument

    -- * Response
    , CreateRoleResponse
    -- ** Response constructor
    , createRoleResponse
    -- ** Response lenses
    , crrRole
    ) where

import Network.AWS.IAM.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createRole' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'crPath'
--
-- * 'crRoleName'
--
-- * 'crAssumeRolePolicyDocument'
data CreateRole = CreateRole'{_crPath :: Maybe Text, _crRoleName :: Text, _crAssumeRolePolicyDocument :: Text} deriving (Eq, Read, Show)

-- | 'CreateRole' smart constructor.
createRole :: Text -> Text -> CreateRole
createRole pRoleName pAssumeRolePolicyDocument = CreateRole'{_crPath = Nothing, _crRoleName = pRoleName, _crAssumeRolePolicyDocument = pAssumeRolePolicyDocument};

-- | The path to the role. For more information about paths, see
-- <http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html IAM Identifiers>
-- in the /Using IAM/ guide.
--
-- This parameter is optional. If it is not included, it defaults to a
-- slash (\/).
crPath :: Lens' CreateRole (Maybe Text)
crPath = lens _crPath (\ s a -> s{_crPath = a});

-- | The name of the role to create.
crRoleName :: Lens' CreateRole Text
crRoleName = lens _crRoleName (\ s a -> s{_crRoleName = a});

-- | The policy that grants an entity permission to assume the role.
crAssumeRolePolicyDocument :: Lens' CreateRole Text
crAssumeRolePolicyDocument = lens _crAssumeRolePolicyDocument (\ s a -> s{_crAssumeRolePolicyDocument = a});

instance AWSPager A where
        page rq rs
          | stop True = Nothing
          | otherwise = Just

instance AWSRequest CreateRole where
        type Sv CreateRole = IAM
        type Rs CreateRole = CreateRoleResponse
        request = post
        response
          = receiveXMLWrapper "CreateRoleResult"
              (\ s h x -> CreateRoleResponse' <$> (x .@ "Role"))

instance ToHeaders CreateRole where
        toHeaders = const mempty

instance ToPath CreateRole where
        toPath = const "/"

instance ToQuery CreateRole where
        toQuery CreateRole'{..}
          = mconcat
              ["Action" =: ("CreateRole" :: ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "Path" =: _crPath, "RoleName" =: _crRoleName,
               "AssumeRolePolicyDocument" =:
                 _crAssumeRolePolicyDocument]

-- | /See:/ 'createRoleResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'crrRole'
newtype CreateRoleResponse = CreateRoleResponse'{_crrRole :: Role} deriving (Eq, Read, Show)

-- | 'CreateRoleResponse' smart constructor.
createRoleResponse :: Role -> CreateRoleResponse
createRoleResponse pRole = CreateRoleResponse'{_crrRole = pRole};

-- | Information about the role.
crrRole :: Lens' CreateRoleResponse Role
crrRole = lens _crrRole (\ s a -> s{_crrRole = a});
