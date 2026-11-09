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
import { LengthMetrics, uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentMediaTextPickerDisableTSA0027 {
  @State name: string = 'UIComponentMediaTextPickerDisableTSA0027';
  @State message: string = 'UIComponentMediaTextPickerDisableTSA0027';
  private apfruits: string[] = ['apple1apple1apple1apple1', 'apple2apple2apple2apple2', 'apple3apple3apple3apple3', 'apple4apple4apple4apple4'];
  private orfruits: string[] = ['orange1orange1orange1orange1', 'orange2orange2orange2orange2', 'orange3orange3orange3orange3', 'orange4orange4orange4orange4'];
  private pefruits: string[] = ['peach1peach1peach1peach1', 'peach2peach2peach2peach2', 'peach3peach3peach3peach3', 'peach4peach4peach4peach4'];
  private multi: string[][] = [this.apfruits, this.orfruits, this.pefruits];
  private cascadeColumnWidths: LengthMetrics[] = [
    LengthMetrics.percent(20),
    LengthMetrics.percent(30),
    LengthMetrics.percent(50)
  ];

  build() {
    Column() {
      Text(this.message)
        .margin(10)
        .font({size: 18})

      TextPicker({
        range: this.multi,
        columnWidths: this.cascadeColumnWidths
      })
        .disableTextStyleAnimation(true)
        .defaultTextStyle({
          minFontSize: 18,
          maxFontSize: 28,
          overflow: TextOverflow.Ellipsis
        })
        .margin(10)

    }
    .width('100%')
    .height('100%')
  }
}
