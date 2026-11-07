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
import { matrix4 } from '@kit.ArkUI';

class ImageModifier implements AttributeModifier<ImageAttribute> {
  public fillColorValue: null | undefined | ResourceColor | ColorContent = Color.Blue;

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.fillColor(this.fillColorValue);
  }
}

@Entry
@Component
struct UIComponentMediaImageFillColorReset0011 {
  @State name: string = 'UIComponentMediaImageFillColorReset0011';
  @State message: string = 'UIComponentMediaImageFillColorReset0011';
  @State modifier: ImageModifier = new ImageModifier();
  @State fillColorValue_Step3_01: null | undefined | ResourceColor | ColorContent = Color.Red;
  @State fillColorValue_Step3_02: null | undefined | ResourceColor | ColorContent = Color.Green;
  @State fillColorValue_Step4_01: null | undefined | ResourceColor | ColorContent = 0xffffff;
  @State fillColorValue_Step4_02: null | undefined | ResourceColor | ColorContent = 0xffff0000;
  @State fillColorValue_Step5_01: null | undefined | ResourceColor | ColorContent = '#ffffff';
  // @State fillColorValue_Step5_02: null | undefined | ResourceColor | ColorContent = '#ff0000';
  @State fillColorValue_Step5_02: null | undefined | ResourceColor | ColorContent = '#ff000000';
  @State fillColorValue_Step5_03: null | undefined | ResourceColor | ColorContent = 'rgba(255, 100, 255, 0.5)';
  @State fillColorValue_Step6_01: null | undefined | ResourceColor | ColorContent = null;
  @State fillColorValue_Step6_02: null | undefined | ResourceColor | ColorContent = undefined;
  @State fillColorValue_Step7_01: null | undefined | ResourceColor | ColorContent = 'xxxx';

  build() {
    Column() {
      Text(this.message)
        .margin(10)
      Button('Switch to ColorContent.ORIGIN')
        .onClick(() => {
          this.fillColorValue_Step3_01 = ColorContent.ORIGIN;
          this.fillColorValue_Step3_02 = ColorContent.ORIGIN;
          this.fillColorValue_Step4_01 = ColorContent.ORIGIN;
          this.fillColorValue_Step4_02 = ColorContent.ORIGIN;
          this.fillColorValue_Step5_01 = ColorContent.ORIGIN;
          this.fillColorValue_Step5_02 = ColorContent.ORIGIN;
          this.fillColorValue_Step5_03 = ColorContent.ORIGIN;
          this.fillColorValue_Step6_01 = ColorContent.ORIGIN;
          this.fillColorValue_Step6_02 = ColorContent.ORIGIN;
          this.fillColorValue_Step7_01 = ColorContent.ORIGIN;
          this.modifier.fillColorValue = ColorContent.ORIGIN;
        })
        .margin(10)
        .id(this.name + '_01')

      Row() {
        Text('Step 2:')
          .margin(5)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
      }

      Row() {
        Text('Step 3:')
          .margin(5)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
          .fillColor(this.fillColorValue_Step3_01)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
          .fillColor(this.fillColorValue_Step3_02)
      }

      Row() {
        Text('Step 4:')
          .margin(5)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
          .fillColor(this.fillColorValue_Step4_01)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
          .fillColor(this.fillColorValue_Step4_02)
      }

      Row() {
        Text('Step 5:')
          .margin(5)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
          .fillColor(this.fillColorValue_Step5_01)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
          .fillColor(this.fillColorValue_Step5_02)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
          .fillColor(this.fillColorValue_Step5_03)
      }

      Row() {
        Text('Step 6:')
          .margin(5)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
          .fillColor(this.fillColorValue_Step6_01)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
          .fillColor(this.fillColorValue_Step6_02)
      }

      Row() {
        Text('Step 7:')
          .margin(5)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
          .fillColor(this.fillColorValue_Step7_01)
      }

      Row() {
        Text('Step 8:')
          .margin(5)
        Image('/images/UIComponentMediaImageFillColorReset.svg')
          .margin(5)
          .width(50)
          .height(50)
          .attributeModifier(this.modifier)
      }

    }
    .width('100%')
    .height('100%')
  }
}
