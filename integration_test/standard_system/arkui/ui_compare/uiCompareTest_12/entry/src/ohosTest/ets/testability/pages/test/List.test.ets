/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import UiComponentTextRichEditorAdaptiveAging
  from './UiComponentTextRichEditorAdaptiveAgingTest/UiComponentTextRichEditorAdaptiveAging.test';
import UiComponentTextRichEditorDarkAndBase
  from './UiComponentTextRichEditorDarkandbaseTest/UiComponentTextRichEditorDarkAndBase.test';
import UiComponentTextRichEditorOptimizeSelectAllMenuLocation
  from './UiComponentTextRichEditorOptimizeSelectAllMenuLocationTest/UiComponentTextRichEditorOptimizeSelectAllMenuLocation.test';
import UiComponentTextRichEditorLineHeightAndLetterSpacing
  from './UiComponentTextRichEditorLineHeightAndLetterSpacingTest/UiComponentTextRichEditorLineHeightAndLetterSpacing.test';

import UiComponentTextRichEditorAvoidCursor
  from './UiComponentTextRichEditorAvoidCursorTest/UiComponentTextRichEditorAvoidCursor.test';
import UiComponentTextRichEditorBuilderSpanDrag
  from './UiComponentTextRichEditorBuilderSpanDragTest/UiComponentTextRichEditorBuilderSpanDrag.test';

import UiComponentTextRichEditorDoubleClick
  from './UiComponentTextRichEditorDoubleClickTest/UiComponentTextRichEditorDoubleClick.test';
import UiComponentTextRichEditorGundongtiao
  from './UiComponentTextRichEditorGundongtiaoTest/UiComponentTextRichEditorGundongtiao.test';
import UiComponentTextRichEditorThreeStrikes
  from './UiComponentTextRichEditorThreeStrikesTest/UiComponentTextRichEditorThreeStrikes.test';
import UiComponentTextRichEditorLineBreakStrategy
  from './UiComponentTextRichEditorLineBreakStrategyTest/UiComponentTextRichEditorLineBreakStrategy.test';
import UiComponentTextRichEditorLongPressTouying
  from './UiComponentTextRichEditorLongPressTouyingTest/UiComponentTextRichEditorLongPressTouying.test';
import UiComponentTextRichEditorDragPlainText
  from './UiComponentTextRichEditorDragPlainTextTest/UiComponentTextRichEditorDragPlainText.test';
import UiComponentTextRichEditorOnDragStart
  from './UiComponentTextRichEditorOnDragStartTest/UiComponentTextRichEditorOnDragStart.test';
import UiRichEditorScroll from './UiRichEditorScrollTest/UiRichEditorScroll.test';
import UiComponentTextRichEditorFloatOff
  from './UiComponentTextRichEditorFloatTest/UiComponentTextRichEditorFloatOff.test';
import UiComponentTextRichEditorCustomKeyboardAvoidance
  from './UiComponentTextRichEditorCustomKeyboardAvoidanceTest/UiComponentTextRichEditorCustomKeyboardAvoidance.test';
import UiComponentTextRichEditorInterface
  from './UiComponentTextRichEditorInterfaceTest/UiComponentTextRichEditorInterface.test';


// 定义总测试函数，依次调用所有测试套
export default function testSuites() {
  UiComponentTextRichEditorAdaptiveAging()
  UiComponentTextRichEditorDarkAndBase()
  UiComponentTextRichEditorOptimizeSelectAllMenuLocation()
  UiComponentTextRichEditorLineHeightAndLetterSpacing()
  UiComponentTextRichEditorBuilderSpanDrag()
  UiComponentTextRichEditorAvoidCursor()
  UiComponentTextRichEditorDoubleClick()
  UiComponentTextRichEditorGundongtiao()
  UiComponentTextRichEditorThreeStrikes()
  UiComponentTextRichEditorLineBreakStrategy()
  UiComponentTextRichEditorLongPressTouying()
  UiComponentTextRichEditorDragPlainText()
  UiComponentTextRichEditorOnDragStart()
  UiRichEditorScroll()
  UiComponentTextRichEditorFloatOff()
  UiComponentTextRichEditorCustomKeyboardAvoidance()
  UiComponentTextRichEditorInterface()
}