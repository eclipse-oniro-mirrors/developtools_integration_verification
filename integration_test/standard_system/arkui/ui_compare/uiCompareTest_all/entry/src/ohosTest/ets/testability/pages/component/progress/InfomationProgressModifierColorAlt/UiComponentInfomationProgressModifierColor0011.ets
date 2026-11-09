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
// xxx.ets
import { ProgressModifier, SelectOptions } from '@kit.ArkUI';

class MyProgressModifier implements AttributeModifier<ProgressModifier> {
  public isDark: boolean = false;

  applyNormalAttribute(instance: ProgressAttribute): void
  {
    if (this.isDark) {
      instance.backgroundColor(Color.Black);
    }
    else {
      instance.backgroundColor(Color.Red);
    }
  }
}

@Entry
@Component
struct UiComponentInfomationProgressModifierColor0011 {
  @State modifier: MyProgressModifier = new MyProgressModifier();

  build() {
    Row() {
      Column() {
        Progress({ value: 0, type: ProgressType.Ring })
          .attributeModifier(this.modifier)
        Button('点击切换').onClick(() => {
          this.modifier.isDark = !this.modifier.isDark;
        }).width('100%')
          .id('UiComponentInfomationProgressModifierColor0011_001')
      }
      .width('100%')
    }
    .height('100%')
  }
}
