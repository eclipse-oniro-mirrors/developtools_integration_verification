/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import demoTest from  './Demo.test'
import UITestCaseTest from  './UITestCaseTest/UITestCase.test'
import UIFrameworkTestCaseTest from './UIFrameworkTest/UIFrameworkTestCase.test'
import UIAttributeModifierTest from './UIAttributeModifierTest/UIAttributeModifierTestCase.test'
import UITransformationTest from './UTransformationTest/UTransformationTestCase.test'
import UIRadialGradientTest from './UIRadialGradientTest/UIRadialGradientTestCase.test'
import UIPositionOffsetTest from './UIPositionOffsetTest/UIPositionOffsetTestCase.test'
import UIBGSeriableTest from './UIBGSeriableTest/UIBGSeriableTestCase.test'
import UIStateStylesTest from './UIStateStylesTest/UIStateStylesTestCase.test'
import UIOverlayTest from './UIOverlayTest/UIOverlayTestCase.test'
import UIFocusOptimizationTest from './UIFocusOptimizationTest/UIFocusOptimizationTestCase.test'

export default function testsuite() {
  demoTest();
  UITestCaseTest();
  UIFrameworkTestCaseTest();
  UIAttributeModifierTest();
  UITransformationTest();
  UIRadialGradientTest();
  UIPositionOffsetTest();
  UIBGSeriableTest();
  UIStateStylesTest();
  UIOverlayTest();
  UIFocusOptimizationTest();
}