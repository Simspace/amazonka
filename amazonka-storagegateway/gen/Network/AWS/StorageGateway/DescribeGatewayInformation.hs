{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.StorageGateway.DescribeGatewayInformation
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

-- | This operation returns metadata about a gateway such as its name,
-- network interfaces, configured time zone, and the state (whether the
-- gateway is running or not). To specify which gateway to describe, use
-- the Amazon Resource Name (ARN) of the gateway in your request.
--
-- <http://docs.aws.amazon.com/storagegateway/latest/APIReference/API_DescribeGatewayInformation.html>
module Network.AWS.StorageGateway.DescribeGatewayInformation
    (
    -- * Request
      DescribeGatewayInformation
    -- ** Request constructor
    , describeGatewayInformation
    -- ** Request lenses
    , dgiGatewayARN

    -- * Response
    , DescribeGatewayInformationResponse
    -- ** Response constructor
    , describeGatewayInformationResponse
    -- ** Response lenses
    , dgirGatewayState
    , dgirGatewayARN
    , dgirGatewayNetworkInterfaces
    , dgirNextUpdateAvailabilityDate
    , dgirLastSoftwareUpdate
    , dgirGatewayId
    , dgirGatewayType
    , dgirGatewayTimezone
    ) where

import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.StorageGateway.Types

-- | /See:/ 'describeGatewayInformation' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dgiGatewayARN'
newtype DescribeGatewayInformation = DescribeGatewayInformation'{_dgiGatewayARN :: Text} deriving (Eq, Read, Show)

-- | 'DescribeGatewayInformation' smart constructor.
describeGatewayInformation :: Text -> DescribeGatewayInformation
describeGatewayInformation pGatewayARN = DescribeGatewayInformation'{_dgiGatewayARN = pGatewayARN};

-- | FIXME: Undocumented member.
dgiGatewayARN :: Lens' DescribeGatewayInformation Text
dgiGatewayARN = lens _dgiGatewayARN (\ s a -> s{_dgiGatewayARN = a});

instance AWSPager A where
        page rq rs
          | stop True = Nothing
          | otherwise = Just

instance AWSRequest DescribeGatewayInformation where
        type Sv DescribeGatewayInformation = StorageGateway
        type Rs DescribeGatewayInformation =
             DescribeGatewayInformationResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DescribeGatewayInformationResponse' <$>
                   (x .?> "GatewayState") <*> (x .?> "GatewayARN") <*>
                     (x .?> "GatewayNetworkInterfaces" .!@ mempty)
                     <*> (x .?> "NextUpdateAvailabilityDate")
                     <*> (x .?> "LastSoftwareUpdate")
                     <*> (x .?> "GatewayId")
                     <*> (x .?> "GatewayType")
                     <*> (x .?> "GatewayTimezone"))

instance ToHeaders DescribeGatewayInformation where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("StorageGateway_20130630.DescribeGatewayInformation"
                       :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DescribeGatewayInformation where
        toJSON DescribeGatewayInformation'{..}
          = object ["GatewayARN" .= _dgiGatewayARN]

instance ToPath DescribeGatewayInformation where
        toPath = const "/"

instance ToQuery DescribeGatewayInformation where
        toQuery = const mempty

-- | /See:/ 'describeGatewayInformationResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dgirGatewayState'
--
-- * 'dgirGatewayARN'
--
-- * 'dgirGatewayNetworkInterfaces'
--
-- * 'dgirNextUpdateAvailabilityDate'
--
-- * 'dgirLastSoftwareUpdate'
--
-- * 'dgirGatewayId'
--
-- * 'dgirGatewayType'
--
-- * 'dgirGatewayTimezone'
data DescribeGatewayInformationResponse = DescribeGatewayInformationResponse'{_dgirGatewayState :: Maybe Text, _dgirGatewayARN :: Maybe Text, _dgirGatewayNetworkInterfaces :: Maybe [NetworkInterface], _dgirNextUpdateAvailabilityDate :: Maybe Text, _dgirLastSoftwareUpdate :: Maybe Text, _dgirGatewayId :: Maybe Text, _dgirGatewayType :: Maybe Text, _dgirGatewayTimezone :: Maybe Text} deriving (Eq, Read, Show)

-- | 'DescribeGatewayInformationResponse' smart constructor.
describeGatewayInformationResponse :: DescribeGatewayInformationResponse
describeGatewayInformationResponse = DescribeGatewayInformationResponse'{_dgirGatewayState = Nothing, _dgirGatewayARN = Nothing, _dgirGatewayNetworkInterfaces = Nothing, _dgirNextUpdateAvailabilityDate = Nothing, _dgirLastSoftwareUpdate = Nothing, _dgirGatewayId = Nothing, _dgirGatewayType = Nothing, _dgirGatewayTimezone = Nothing};

-- | One of the values that indicates the operating state of the gateway.
dgirGatewayState :: Lens' DescribeGatewayInformationResponse (Maybe Text)
dgirGatewayState = lens _dgirGatewayState (\ s a -> s{_dgirGatewayState = a});

-- | FIXME: Undocumented member.
dgirGatewayARN :: Lens' DescribeGatewayInformationResponse (Maybe Text)
dgirGatewayARN = lens _dgirGatewayARN (\ s a -> s{_dgirGatewayARN = a});

-- | A NetworkInterface array that contains descriptions of the gateway
-- network interfaces.
dgirGatewayNetworkInterfaces :: Lens' DescribeGatewayInformationResponse [NetworkInterface]
dgirGatewayNetworkInterfaces = lens _dgirGatewayNetworkInterfaces (\ s a -> s{_dgirGatewayNetworkInterfaces = a}) . _Default;

-- | The date on which an update to the gateway is available. This date is in
-- the time zone of the gateway. If the gateway is not available for an
-- update this field is not returned in the response.
dgirNextUpdateAvailabilityDate :: Lens' DescribeGatewayInformationResponse (Maybe Text)
dgirNextUpdateAvailabilityDate = lens _dgirNextUpdateAvailabilityDate (\ s a -> s{_dgirNextUpdateAvailabilityDate = a});

-- | The date on which the last software update was applied to the gateway.
-- If the gateway has never been updated, this field does not return a
-- value in the response.
dgirLastSoftwareUpdate :: Lens' DescribeGatewayInformationResponse (Maybe Text)
dgirLastSoftwareUpdate = lens _dgirLastSoftwareUpdate (\ s a -> s{_dgirLastSoftwareUpdate = a});

-- | The gateway ID.
dgirGatewayId :: Lens' DescribeGatewayInformationResponse (Maybe Text)
dgirGatewayId = lens _dgirGatewayId (\ s a -> s{_dgirGatewayId = a});

-- | The type of the gateway.
dgirGatewayType :: Lens' DescribeGatewayInformationResponse (Maybe Text)
dgirGatewayType = lens _dgirGatewayType (\ s a -> s{_dgirGatewayType = a});

-- | One of the values that indicates the time zone configured for the
-- gateway.
dgirGatewayTimezone :: Lens' DescribeGatewayInformationResponse (Maybe Text)
dgirGatewayTimezone = lens _dgirGatewayTimezone (\ s a -> s{_dgirGatewayTimezone = a});
