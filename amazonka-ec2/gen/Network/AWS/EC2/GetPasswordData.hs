{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.EC2.GetPasswordData
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

-- | Retrieves the encrypted administrator password for an instance running
-- Windows.
--
-- The Windows password is generated at boot if the @EC2Config@ service
-- plugin, @Ec2SetPassword@, is enabled. This usually only happens the
-- first time an AMI is launched, and then @Ec2SetPassword@ is
-- automatically disabled. The password is not generated for rebundled AMIs
-- unless @Ec2SetPassword@ is enabled before bundling.
--
-- The password is encrypted using the key pair that you specified when you
-- launched the instance. You must provide the corresponding key pair file.
--
-- Password generation and encryption takes a few moments. We recommend
-- that you wait up to 15 minutes after launching an instance before trying
-- to retrieve the generated password.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-GetPasswordData.html>
module Network.AWS.EC2.GetPasswordData
    (
    -- * Request
      GetPasswordData
    -- ** Request constructor
    , getPasswordData
    -- ** Request lenses
    , gpdDryRun
    , gpdInstanceId

    -- * Response
    , GetPasswordDataResponse
    -- ** Response constructor
    , getPasswordDataResponse
    -- ** Response lenses
    , gpdrInstanceId
    , gpdrPasswordData
    , gpdrTimestamp
    ) where

import Network.AWS.EC2.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'getPasswordData' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gpdDryRun'
--
-- * 'gpdInstanceId'
data GetPasswordData = GetPasswordData'{_gpdDryRun :: Maybe Bool, _gpdInstanceId :: Text} deriving (Eq, Read, Show)

-- | 'GetPasswordData' smart constructor.
getPasswordData :: Text -> GetPasswordData
getPasswordData pInstanceId = GetPasswordData'{_gpdDryRun = Nothing, _gpdInstanceId = pInstanceId};

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
gpdDryRun :: Lens' GetPasswordData (Maybe Bool)
gpdDryRun = lens _gpdDryRun (\ s a -> s{_gpdDryRun = a});

-- | The ID of the Windows instance.
gpdInstanceId :: Lens' GetPasswordData Text
gpdInstanceId = lens _gpdInstanceId (\ s a -> s{_gpdInstanceId = a});

instance AWSPager A where
        page rq rs
          | stop True = Nothing
          | otherwise = Just

instance AWSRequest GetPasswordData where
        type Sv GetPasswordData = EC2
        type Rs GetPasswordData = GetPasswordDataResponse
        request = post
        response
          = receiveXML
              (\ s h x ->
                 GetPasswordDataResponse' <$>
                   (x .@ "instanceId") <*> (x .@ "passwordData") <*>
                     (x .@ "timestamp"))

instance ToHeaders GetPasswordData where
        toHeaders = const mempty

instance ToPath GetPasswordData where
        toPath = const "/"

instance ToQuery GetPasswordData where
        toQuery GetPasswordData'{..}
          = mconcat
              ["Action" =: ("GetPasswordData" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "DryRun" =: _gpdDryRun,
               "InstanceId" =: _gpdInstanceId]

-- | /See:/ 'getPasswordDataResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gpdrInstanceId'
--
-- * 'gpdrPasswordData'
--
-- * 'gpdrTimestamp'
data GetPasswordDataResponse = GetPasswordDataResponse'{_gpdrInstanceId :: Text, _gpdrPasswordData :: Text, _gpdrTimestamp :: ISO8601} deriving (Eq, Read, Show)

-- | 'GetPasswordDataResponse' smart constructor.
getPasswordDataResponse :: Text -> Text -> UTCTime -> GetPasswordDataResponse
getPasswordDataResponse pInstanceId pPasswordData pTimestamp = GetPasswordDataResponse'{_gpdrInstanceId = pInstanceId, _gpdrPasswordData = pPasswordData, _gpdrTimestamp = _Time # pTimestamp};

-- | The ID of the Windows instance.
gpdrInstanceId :: Lens' GetPasswordDataResponse Text
gpdrInstanceId = lens _gpdrInstanceId (\ s a -> s{_gpdrInstanceId = a});

-- | The password of the instance.
gpdrPasswordData :: Lens' GetPasswordDataResponse Text
gpdrPasswordData = lens _gpdrPasswordData (\ s a -> s{_gpdrPasswordData = a});

-- | The time the data was last updated.
gpdrTimestamp :: Lens' GetPasswordDataResponse UTCTime
gpdrTimestamp = lens _gpdrTimestamp (\ s a -> s{_gpdrTimestamp = a}) . _Time;
