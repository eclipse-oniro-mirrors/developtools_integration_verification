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

interface PickerOption {
  canLoop: boolean;
  defaultPickerItemHeight: string;
  disappearTextStyle: PickerTextStyle;
  selectedTextStyle: PickerTextStyle;
  textStyle: PickerTextStyle;
  selectedIndex: number;
}

@Entry
@Component
struct CommonAttrCommonModifier0260 {
  @State currentIndex: number = 0
  
  private pickerData: string[] = ['Item 0', 'Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6', 'Item 7', 'Item 8', 'Item 9']
  
  private pickerOptions: PickerOption[] = [
    {
      canLoop: true,
      defaultPickerItemHeight: '16',
      disappearTextStyle: { font: { size: 15, weight: FontWeight.Lighter } },
      selectedTextStyle: { color: Color.Red, font: { size: 20, weight: undefined } },
      textStyle: { font: { size: 15, weight: FontWeight.Lighter } },
      selectedIndex: 99
    }
  ]

  private pickerNames: string[] = [
    'CanLoop: true, Height: 16, SelectedIndex: 99'
  ]

  build() {
    Column() {
      Text('Picker Properties Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Config: ${this.pickerNames[this.currentIndex]}`)
        .fontSize(12)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)
        .maxLines(2)

      // 创建测试区域 - Picker组件属性测试
      Column() {
        Text('Picker Configuration Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Row() {
          // 参考Picker（默认配置）
          Column() {
            Text('Reference Picker')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })

            TextPicker({ range: this.pickerData, selected: 2 })
              .defaultPickerItemHeight('20')
              .canLoop(false)
              .selectedIndex(2)
              .textStyle({ font: { size: 16, weight: FontWeight.Normal } })
              .selectedTextStyle({ color: Color.Blue, font: { size: 18, weight: FontWeight.Bold } })
              .disappearTextStyle({ font: { size: 14, weight: FontWeight.Normal } })
              .width(120)
              .height(150)
          }
          .width('19.44%')
          .margin(10)
          .padding(10)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)

          // 测试Picker（应用配置）
          Column() {
            Text('Test Picker')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })

            TextPicker({ range: this.pickerData, selected: 0 })
              .defaultPickerItemHeight(this.pickerOptions[this.currentIndex].defaultPickerItemHeight)
              .canLoop(this.pickerOptions[this.currentIndex].canLoop)
              .selectedIndex(this.pickerOptions[this.currentIndex].selectedIndex)
              .textStyle(this.pickerOptions[this.currentIndex].textStyle)
              .selectedTextStyle(this.pickerOptions[this.currentIndex].selectedTextStyle)
              .disappearTextStyle(this.pickerOptions[this.currentIndex].disappearTextStyle)
              .width(120)
              .height(150)
              .id('picker_component_commonmodifier_0260')
          }
          .width('19.44%')
          .margin(10)
          .padding(10)
          .backgroundColor('#E3F2FD')
          .borderRadius(8)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('48.61%')
        .height('16.39%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：属性详情展示
      Column() {
        Text('Configuration Details')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Column() {
          Row() {
            Text('CanLoop:')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .width(120)
            Text(`${this.pickerOptions[this.currentIndex].canLoop}`)
              .fontSize(12)
              .fontColor(this.pickerOptions[this.currentIndex].canLoop ? Color.Green : Color.Red)
          }
          .width('100%')
          .margin({ bottom: 5 })

          Row() {
            Text('ItemHeight:')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .width(120)
            Text(`${this.pickerOptions[this.currentIndex].defaultPickerItemHeight}`)
              .fontSize(12)
              .fontColor(Color.Blue)
          }
          .width('100%')
          .margin({ bottom: 5 })

          Row() {
            Text('SelectedIndex:')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .width(120)
            Text(`${this.pickerOptions[this.currentIndex].selectedIndex}`)
              .fontSize(12)
              .fontColor(Color.Orange)
          }
          .width('100%')
          .margin({ bottom: 5 })

          Row() {
            Text('TextStyle Size:')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .width(120)
            Text(`${this.pickerOptions[this.currentIndex].textStyle.font?.size}`)
              .fontSize(12)
              .fontColor(Color.Pink)
          }
          .width('100%')
          .margin({ bottom: 5 })

          Row() {
            Text('Selected Size:')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .width(120)
            Text(`${this.pickerOptions[this.currentIndex].selectedTextStyle.font?.size}`)
              .fontSize(12)
              .fontColor(Color.Red)
          }
          .width('100%')
        }
        .width('41.67%')
        .backgroundColor('#FAFAFA')
        .border({ width: 1, color: Color.Gray })
        .padding(15)
        .borderRadius(8)
      }
      .margin({ bottom: 30 })

      // 显示属性说明
      Column() {
        Text('Picker Properties Guide:')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Column() {
          Text('• CanLoop: Enables infinite scrolling in picker')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• DefaultPickerItemHeight: Height of each picker item')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• SelectedIndex: Initially selected item (99 = out of range)')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• TextStyle: Style for normal items')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• SelectedTextStyle: Style for selected item')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
        }
        .width('44.44%')
        .backgroundColor('#F0F8FF')
        .border({ width: 1, color: Color.Blue })
        .padding(8)
      }
      .margin({ bottom: 20 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0260')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.pickerOptions.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0260')
          .margin({ left: 10 })
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
