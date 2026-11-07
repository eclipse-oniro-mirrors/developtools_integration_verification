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

class MyCheckboxStyle implements ContentModifier<CheckBoxConfiguration> {
  selectedColor: Color = Color.White;

  constructor(selectedColor: Color) {
    this.selectedColor = selectedColor;
  }

  applyContent(): WrappedBuilder<[CheckBoxConfiguration]> {
    return wrapBuilder(buildCheckbox);
  }
}

@Builder
function buildCheckbox(config: CheckBoxConfiguration) {
  Column({ space: 10 }) {
    Text(config.name + (config.selected ? '（ 选中 ）' : '（ 非选中 ）')).margin({ right: 70, top: 50 })
    Text(config.enabled ? 'enabled true' : 'enabled false').margin({ right: 110 })
    Shape() {
      Path()
        .width(100)
        .height(100)
        .commands('M100 0 L0 100 L50 200 L150 200 L200 100 Z')
        .fillOpacity(0)
        .strokeWidth(3)
        .onClick(() => {
          if (config.selected) {
            config.triggerChange(false);
          } else {
            config.triggerChange(true);
          }
        })
        .opacity(config.enabled ? 1 : 0.1)
      Path()
        .width(10)
        .height(10)
        .commands('M50 0 L100 100 L0 100 Z')
        .visibility(config.selected ? Visibility.Visible : Visibility.Hidden)
        .fill(config.selected ? (config.contentModifier as MyCheckboxStyle).selectedColor : Color.Black)
        .stroke((config.contentModifier as MyCheckboxStyle).selectedColor)
        .margin({ left: 10, top: 10 })
        .opacity(config.enabled ? 1 : 0.1)
    }
    .width(300)
    .height(200)
    .viewPort({
      x: 0,
      y: 0,
      width: 310,
      height: 310
    })
    .strokeLineJoin(LineJoinStyle.Miter)
    .strokeMiterLimit(5)
    .margin({ left: 50 })
  }
}

@Entry
@Component
struct UiComponentButtonTextPickerArkui24 {
  @State arrOne: string[] = ['1', '2', '3'];
  @State arrTwo: string[] = ['1', '2', '3', '4'];
  @State arrThree: string[] = ['1', '2', '3', '4', '5', '6'];
  @State selected: boolean|undefined = false;
  @State infoOne: string = '';
  @State infoTwo: string = '';
  @State infoThree: string = '';
  @State Text: string='Checkbox set contentModifier to undefined'
  @State color: Color|undefined = Color.Gray
  @State shape : CheckBoxShape|undefined= CheckBoxShape.ROUNDED_SQUARE

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        CheckboxGroup({ group: 'checkboxGroupOne' })
          .selectAll(this.selected)
          .checkboxShape(CheckBoxShape.ROUNDED_SQUARE)
          .selectedColor('#007DFF')
          .mark({
            strokeColor : Color.Red,
            strokeWidth: '20vp',
            size: '20vp'
          })
          .checkboxShape(this.shape)
          .onChange((itemName: CheckboxGroupResult) => {
            this.infoOne = 'checkboxGroupOne' + JSON.stringify(itemName);
            console.info('checkboxGroupOne' + JSON.stringify(itemName));
          })
        Text('checkboxGroupOne Select All')
          .fontSize(14)
          .lineHeight(20)
          .fontColor('#182431')
          .fontWeight(500)
      }

      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        Column() {
          ForEach(this.arrOne, (item: string) => {
            Row() {
              Checkbox({ name: 'checkbox' + item, group: 'checkboxGroupOne' })
                .contentModifier(undefined)
                .onChange((value: boolean) => {
                  console.info('Checkbox' + item + 'change is' + value);
                })
                .margin({ left: 20 })
              Text('Checkbox' + item)
                .fontSize(14)
                .lineHeight(20)
                .fontColor('#182431')
                .fontWeight(500)
                .margin({ left: 10 })
            }
          }, (item: string) => item)
        }
      }.margin({ bottom: 15 })

      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        CheckboxGroup({ group: 'checkboxGroupTwo' })
          .selectAll(this.selected)
          .checkboxShape(this.shape)
          .mark({
            strokeColor : Color.Red,
            strokeWidth: '20vp',
            size: '20vp'
          })
          .selectedColor('#007DFF')
          .onChange((itemName: CheckboxGroupResult) => {
            this.infoTwo = 'checkboxGroupTwo' + JSON.stringify(itemName);
            console.info('checkboxGroupTwo' + JSON.stringify(itemName));
          })
        Text('checkboxGroupTwo Select All')
          .fontSize(14)
          .lineHeight(20)
          .fontColor('#182431')
          .fontWeight(500)
      }

      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        Column() {
          ForEach(this.arrTwo, (item: string) => {
            Row() {
              Checkbox({ name: 'checkbox' + item, group: 'checkboxGroupTwo' })
                .contentModifier(undefined)
                .onChange((value: boolean) => {
                  console.info('Checkbox' + item + 'change is' + value);
                })
                .margin({ left: 20 })
              Text('Checkbox' + item)
                .fontSize(14)
                .lineHeight(20)
                .fontColor('#182431')
                .fontWeight(500)
                .margin({ left: 10 })
            }
          }, (item: string) => item)
        }
      }
      .margin({ bottom: 15 })

      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        CheckboxGroup({ group: 'checkboxGroupThree' })
          .selectAll(this.selected)
          .checkboxShape(this.shape)
          .selectedColor('#007DFF')
          .mark({
            strokeColor : Color.Red,
            strokeWidth: '20vp',
            size: '20vp'
          })
          .onChange((itemName: CheckboxGroupResult) => {
            this.infoThree = 'checkboxGroupThree' + JSON.stringify(itemName);
            console.info('checkboxGroupThree' + JSON.stringify(itemName));
          })
        Text('checkboxGroupThree Select All')
          .fontSize(14)
          .lineHeight(20)
          .fontColor('#182431')
          .fontWeight(500)
      }

      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        Column() {
          ForEach(this.arrThree, (item: string) => {
            Row() {
              Checkbox({ name: 'checkbox' + item, group: 'checkboxGroupThree' })
                .contentModifier(undefined)
                .onChange((value: boolean) => {
                  console.info('Checkbox' + item + 'change is' + value);
                })
                .margin({ left: 20 })
              Text('Checkbox' + item)
                .fontSize(14)
                .lineHeight(20)
                .fontColor('#182431')
                .fontWeight(500)
                .margin({ left: 10 })
            }
          }, (item: string) => item)
        }
      }
      .margin({ bottom: 15 })

      Text(this.Text)
        .fontSize(5)
        .lineHeight(2)
        .fontColor('#182431')
        .fontWeight(500)
        .margin({ left: 10 })
    }
    .padding(10)
  }
}