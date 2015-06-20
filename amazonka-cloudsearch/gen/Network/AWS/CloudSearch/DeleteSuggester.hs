{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.CloudSearch.DeleteSuggester
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

-- | Deletes a suggester. For more information, see
-- <http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html Getting Search Suggestions>
-- in the /Amazon CloudSearch Developer Guide/.
--
-- <http://docs.aws.amazon.com/cloudsearch/latest/developerguide/API_DeleteSuggester.html>
module Network.AWS.CloudSearch.DeleteSuggester
    (
    -- * Request
      DeleteSuggester
    -- ** Request constructor
    , deleteSuggester
    -- ** Request lenses
    , deleDomainName
    , deleSuggesterName

    -- * Response
    , DeleteSuggesterResponse
    -- ** Response constructor
    , deleteSuggesterResponse
    -- ** Response lenses
    , delSuggester
    ) where

import Network.AWS.CloudSearch.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteSuggester' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'deleDomainName'
--
-- * 'deleSuggesterName'
data DeleteSuggester = DeleteSuggester'{_deleDomainName :: Text, _deleSuggesterName :: Text} deriving (Eq, Read, Show)

-- | 'DeleteSuggester' smart constructor.
deleteSuggester :: Text -> Text -> DeleteSuggester
deleteSuggester pDomainName pSuggesterName = DeleteSuggester'{_deleDomainName = pDomainName, _deleSuggesterName = pSuggesterName};

-- | FIXME: Undocumented member.
deleDomainName :: Lens' DeleteSuggester Text
deleDomainName = lens _deleDomainName (\ s a -> s{_deleDomainName = a});

-- | Specifies the name of the suggester you want to delete.
deleSuggesterName :: Lens' DeleteSuggester Text
deleSuggesterName = lens _deleSuggesterName (\ s a -> s{_deleSuggesterName = a});

instance AWSPager A where
        page rq rs
          | stop True = Nothing
          | otherwise = Just

instance AWSRequest DeleteSuggester where
        type Sv DeleteSuggester = CloudSearch
        type Rs DeleteSuggester = DeleteSuggesterResponse
        request = post
        response
          = receiveXMLWrapper "DeleteSuggesterResult"
              (\ s h x ->
                 DeleteSuggesterResponse' <$> (x .@ "Suggester"))

instance ToHeaders DeleteSuggester where
        toHeaders = const mempty

instance ToPath DeleteSuggester where
        toPath = const "/"

instance ToQuery DeleteSuggester where
        toQuery DeleteSuggester'{..}
          = mconcat
              ["Action" =: ("DeleteSuggester" :: ByteString),
               "Version" =: ("2013-01-01" :: ByteString),
               "DomainName" =: _deleDomainName,
               "SuggesterName" =: _deleSuggesterName]

-- | /See:/ 'deleteSuggesterResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'delSuggester'
newtype DeleteSuggesterResponse = DeleteSuggesterResponse'{_delSuggester :: SuggesterStatus} deriving (Eq, Read, Show)

-- | 'DeleteSuggesterResponse' smart constructor.
deleteSuggesterResponse :: SuggesterStatus -> DeleteSuggesterResponse
deleteSuggesterResponse pSuggester = DeleteSuggesterResponse'{_delSuggester = pSuggester};

-- | The status of the suggester being deleted.
delSuggester :: Lens' DeleteSuggesterResponse SuggesterStatus
delSuggester = lens _delSuggester (\ s a -> s{_delSuggester = a});
