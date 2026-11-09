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
import { uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct UIComponentSpecialComponentsEmbeddedComponentPropertyTestCommonAttributesPaddingMargin0010 {
  @State name: string = 'UIComponentSpecialComponentsEmbeddedComponentPropertyTestCommonAttributesPaddingMargin0010';
  @State message: string = 'UIComponentSpecialComponentsEmbeddedComponentPropertyTestCommonAttributesPaddingMargin0010';

  build() {
    Column() {
      Text(this.message)
        .margin(5)

      Button('MarginPage')
        .id(this.name + '_01')
        .onClick(() => {
          let uiContext: UIContext = this.getUIContext();
          let router = uiContext.getRouter();
          router.pushUrl({
            url: 'testability/pages/component/embedded/SpecialComponentsEmbeddedComponentPropertyTestCommonAttributesPaddingMargin/MarginPage',
          })
            .then(() => {
              console.info('succeeded');
              this.message = 'Start MarginPage succeed.';
            })
            .catch((error: BusinessError) => {
              console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
              this.message = `Start MarginPage failed, code is ${error.code}, message is ${error.message}.`;
            })
        })
        .margin({bottom: 10})

    }
    .width('100%')
    .height('100%')
  }
}
