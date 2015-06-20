{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.ElasticBeanstalk.DescribeConfigurationSettings
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

-- | Returns a description of the settings for the specified configuration
-- set, that is, either a configuration template or the configuration set
-- associated with a running environment.
--
-- When describing the settings for the configuration set associated with a
-- running environment, it is possible to receive two sets of setting
-- descriptions. One is the deployed configuration set, and the other is a
-- draft configuration of an environment that is either in the process of
-- deployment or that failed to deploy.
--
-- Related Topics
--
-- -   DeleteEnvironmentConfiguration
--
-- <http://docs.aws.amazon.com/elasticbeanstalk/latest/api/API_DescribeConfigurationSettings.html>
module Network.AWS.ElasticBeanstalk.DescribeConfigurationSettings
    (
    -- * Request
      DescribeConfigurationSettings
    -- ** Request constructor
    , describeConfigurationSettings
    -- ** Request lenses
    , dcsTemplateName
    , dcsEnvironmentName
    , dcsApplicationName

    -- * Response
    , DescribeConfigurationSettingsResponse
    -- ** Response constructor
    , describeConfigurationSettingsResponse
    -- ** Response lenses
    , dcsrConfigurationSettings
    ) where

import Network.AWS.ElasticBeanstalk.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'describeConfigurationSettings' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dcsTemplateName'
--
-- * 'dcsEnvironmentName'
--
-- * 'dcsApplicationName'
data DescribeConfigurationSettings = DescribeConfigurationSettings'{_dcsTemplateName :: Maybe Text, _dcsEnvironmentName :: Maybe Text, _dcsApplicationName :: Text} deriving (Eq, Read, Show)

-- | 'DescribeConfigurationSettings' smart constructor.
describeConfigurationSettings :: Text -> DescribeConfigurationSettings
describeConfigurationSettings pApplicationName = DescribeConfigurationSettings'{_dcsTemplateName = Nothing, _dcsEnvironmentName = Nothing, _dcsApplicationName = pApplicationName};

-- | The name of the configuration template to describe.
--
-- Conditional: You must specify either this parameter or an
-- EnvironmentName, but not both. If you specify both, AWS Elastic
-- Beanstalk returns an @InvalidParameterCombination@ error. If you do not
-- specify either, AWS Elastic Beanstalk returns a
-- @MissingRequiredParameter@ error.
dcsTemplateName :: Lens' DescribeConfigurationSettings (Maybe Text)
dcsTemplateName = lens _dcsTemplateName (\ s a -> s{_dcsTemplateName = a});

-- | The name of the environment to describe.
--
-- Condition: You must specify either this or a TemplateName, but not both.
-- If you specify both, AWS Elastic Beanstalk returns an
-- @InvalidParameterCombination@ error. If you do not specify either, AWS
-- Elastic Beanstalk returns @MissingRequiredParameter@ error.
dcsEnvironmentName :: Lens' DescribeConfigurationSettings (Maybe Text)
dcsEnvironmentName = lens _dcsEnvironmentName (\ s a -> s{_dcsEnvironmentName = a});

-- | The application for the environment or configuration template.
dcsApplicationName :: Lens' DescribeConfigurationSettings Text
dcsApplicationName = lens _dcsApplicationName (\ s a -> s{_dcsApplicationName = a});

instance AWSPager A where
        page rq rs
          | stop True = Nothing
          | otherwise = Just

instance AWSRequest DescribeConfigurationSettings
         where
        type Sv DescribeConfigurationSettings =
             ElasticBeanstalk
        type Rs DescribeConfigurationSettings =
             DescribeConfigurationSettingsResponse
        request = post
        response
          = receiveXMLWrapper
              "DescribeConfigurationSettingsResult"
              (\ s h x ->
                 DescribeConfigurationSettingsResponse' <$>
                   (x .@? "ConfigurationSettings" .!@ mempty >>=
                      may (parseXMLList "member")))

instance ToHeaders DescribeConfigurationSettings
         where
        toHeaders = const mempty

instance ToPath DescribeConfigurationSettings where
        toPath = const "/"

instance ToQuery DescribeConfigurationSettings where
        toQuery DescribeConfigurationSettings'{..}
          = mconcat
              ["Action" =:
                 ("DescribeConfigurationSettings" :: ByteString),
               "Version" =: ("2010-12-01" :: ByteString),
               "TemplateName" =: _dcsTemplateName,
               "EnvironmentName" =: _dcsEnvironmentName,
               "ApplicationName" =: _dcsApplicationName]

-- | /See:/ 'describeConfigurationSettingsResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dcsrConfigurationSettings'
newtype DescribeConfigurationSettingsResponse = DescribeConfigurationSettingsResponse'{_dcsrConfigurationSettings :: Maybe [ConfigurationSettingsDescription]} deriving (Eq, Read, Show)

-- | 'DescribeConfigurationSettingsResponse' smart constructor.
describeConfigurationSettingsResponse :: DescribeConfigurationSettingsResponse
describeConfigurationSettingsResponse = DescribeConfigurationSettingsResponse'{_dcsrConfigurationSettings = Nothing};

-- | A list of ConfigurationSettingsDescription.
dcsrConfigurationSettings :: Lens' DescribeConfigurationSettingsResponse [ConfigurationSettingsDescription]
dcsrConfigurationSettings = lens _dcsrConfigurationSettings (\ s a -> s{_dcsrConfigurationSettings = a}) . _Default;
