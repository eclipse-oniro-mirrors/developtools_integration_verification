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

import OnKeyEventAttrTest from './OnKeyEventAttrTest/OnKeyEventAttrTest.test'
import KeyEventUnicodeTest from './KeyEventUnicodeTest/KeyEventUnicodeTest.test'
import MouseTest from './MouseTest/MouseTest.test'
import MouseBackwardanalysisTest from './MouseBackwardanalysisTest/MouseBackwardanalysisTest.test'
import MouseRefeshByVsyncTest from './MouseRefeshByVsyncTest/MouseRefeshByVsyncTest.test'
import GestureComponentIdTest from './GestureComponentIdTest/GestureComponentIdTest.test'

export default function testsuite() {
  OnKeyEventAttrTest();
  KeyEventUnicodeTest();
  MouseTest();
  MouseBackwardanalysisTest();
  MouseRefeshByVsyncTest();
  GestureComponentIdTest();
}