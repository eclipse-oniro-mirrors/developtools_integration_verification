/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import FocusTextUITest from './focus_TextUI/FocusTextUIall.test';
import FocusRichEditor from './focus_TextUI/FocusRichEditorTest.test';
import FocusContentModifierTest from './focus_TextUI/FocusContentmodifier.test';
import FocusTextTimerTest from './focus_TextUI/FocusTextTimerTest.test';
import FocusDataPanelTest from './focus_TextUI/FocusDataPanelTest.test';
import FocusFrameNodeTest from './focus_TextUI/FocusFrameNodeTest.test';
import FocusOtherBadgeInterface from './focus_TextUI/FocusOtherBadgeInterface.test';
import FocusMediaBadgeFont from './focus_TextUI/FocusMediaBadgeFont.test';
import FocusMediaBadgeBorder from './focus_TextUI/FocusMediaBadgeBorder.test';
import FocusMediaBadgeLargeFont from './focus_TextUI/FocusMediaBadgeLargeFont.test';
import FocusPatternLockTest from './focus_TextUI/FocusPatternLock.test';
import FocusPopupBoxTest from './focus_TextUI/FocusPopupBox.test';
import FocusTextPickerTest from './focus_TextUI/FocusTextPicker.test';
import FocusChipGroupInterfaceTest from './focus_TextUI/FocusChipGroupInterface.test';
import FocusPBHeightWidthTest from './focus_TextUI/FocusPBHeightWidth.test';
import FocusPBMaxWidthTest from './focus_TextUI/FocusPBMaxWidth.test';
import FocusSegmentButtonTest from './focus_TextUI/FocusSegmentButton.test';
import FocusSegmentButtonV2TestPart1 from './focus_TextUI/FocusSegmentButtonV2_Part1.test';
import FocusSegmentButtonV2TestPart2 from './focus_TextUI/FocusSegmentButtonV2_Part2.test';
import FocusSegmentButtonV2TestPart3 from './focus_TextUI/FocusSegmentButtonV2_Part3.test';
import FocusSegmentButtonV2TestPart4 from './focus_TextUI/FocusSegmentButtonV2_Part4.test';

export default function testsuite() {
  FocusTextUITest();
  FocusDataPanelTest();
  FocusFrameNodeTest();
  FocusOtherBadgeInterface();
  FocusContentModifierTest();
  FocusRichEditor();
  FocusTextTimerTest();
  FocusPatternLockTest();
  FocusMediaBadgeFont();
  FocusMediaBadgeBorder();
  FocusMediaBadgeLargeFont();
  FocusPopupBoxTest();
  FocusTextPickerTest();
  FocusChipGroupInterfaceTest();
  FocusPBHeightWidthTest();
  FocusPBMaxWidthTest();
  FocusSegmentButtonTest();
  FocusSegmentButtonV2TestPart1();
  FocusSegmentButtonV2TestPart2();
  FocusSegmentButtonV2TestPart3();
  FocusSegmentButtonV2TestPart4();
}