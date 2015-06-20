{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.OpsWorks.StartStack
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

-- | Starts a stack\'s instances.
--
-- __Required Permissions__: To use this action, an IAM user must have a
-- Manage permissions level for the stack, or an attached policy that
-- explicitly grants permissions. For more information on user permissions,
-- see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html Managing User Permissions>.
--
-- <http://docs.aws.amazon.com/opsworks/latest/APIReference/API_StartStack.html>
module Network.AWS.OpsWorks.StartStack
    (
    -- * Request
      StartStack
    -- ** Request constructor
    , startStack
    -- ** Request lenses
    , sStackId

    -- * Response
    , StartStackResponse
    -- ** Response constructor
    , startStackResponse
    ) where

import Network.AWS.OpsWorks.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'startStack' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'sStackId'
newtype StartStack = StartStack'{_sStackId :: Text} deriving (Eq, Read, Show)

-- | 'StartStack' smart constructor.
startStack :: Text -> StartStack
startStack pStackId = StartStack'{_sStackId = pStackId};

-- | The stack ID.
sStackId :: Lens' StartStack Text
sStackId = lens _sStackId (\ s a -> s{_sStackId = a});

instance AWSPager A where
        page rq rs
          | stop True = Nothing
          | otherwise = Just

instance AWSRequest StartStack where
        type Sv StartStack = OpsWorks
        type Rs StartStack = StartStackResponse
        request = postJSON
        response = receiveNull StartStackResponse'

instance ToHeaders StartStack where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OpsWorks_20130218.StartStack" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON StartStack where
        toJSON StartStack'{..}
          = object ["StackId" .= _sStackId]

instance ToPath StartStack where
        toPath = const "/"

instance ToQuery StartStack where
        toQuery = const mempty

-- | /See:/ 'startStackResponse' smart constructor.
data StartStackResponse = StartStackResponse' deriving (Eq, Read, Show)

-- | 'StartStackResponse' smart constructor.
startStackResponse :: StartStackResponse
startStackResponse = StartStackResponse';
