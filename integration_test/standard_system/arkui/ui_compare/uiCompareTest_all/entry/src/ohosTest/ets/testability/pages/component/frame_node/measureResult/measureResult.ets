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

@Entry
@Component
struct MeasureResult {
  build() {
    Column() {
      CustomLayout({
        builder: columnChildren
      }).constraintSize({
        minWidth : 20,
        maxWidth: 300,
        minHeight : 10,
        maxHeight: 200})
    }
    .width('100%')
    .height('100%')
    .constraintSize({minWidth : 20, minHeight : 20})
  }
}

@Builder
function columnChildren() {
  ForEach([1], (index: number) => {
    Text('S' + index)
      .fontSize(30)
      .width(100)
      .height(100)
      .constraintSize({minWidth : 100, maxHeight : 200})
  })
}

@Component
struct CustomLayout {
  @State height1:Length | undefined= 0
  @State height2:Length | undefined= 0
  @State width1:Length | undefined= 0
  @State width2:Length | undefined= 0
  @State borderWidthStr:string = ''
  @State marginStr:string = ''
  @State paddingStr:string = ''
  @Builder
  doNothingBuilder() {
  };

  @BuilderParam builder: () => void = this.doNothingBuilder;
  @State startSize: number = 100;
  result: SizeResult = {
    width: 0,
    height: 0
  };

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions) {
    console.log('llhh333 onPlaceChildren ' + constraint.minWidth + '-' + constraint.maxWidth + '-' + constraint.minHeight + '-' + constraint.maxHeight);
    console.log('llhh333 onPlaceChildren selfLayoutInfo ' + selfLayoutInfo.width + '-' + selfLayoutInfo.height);
    let startPos = 300;
    children.forEach((child, childIndex) => {
      let pos = startPos - child.measureResult.height;
      child.layout({ x: pos, y: pos })
    })
    this.borderWidthStr = JSON.stringify(selfLayoutInfo.borderWidth)
    this.marginStr = JSON.stringify(selfLayoutInfo.margin)
    this.paddingStr = JSON.stringify(selfLayoutInfo.padding)
    if (constraint.maxHeight !== undefined &&
      constraint.minHeight !== undefined &&
      constraint.maxWidth !== undefined &&
      constraint.minWidth !== undefined){
      this.height1 = constraint.maxHeight
      this.height2 = constraint.minHeight
      this.width1 = constraint.maxWidth
      this.width2 = constraint.minWidth
    }

  }

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions) {
    console.log('onMeasureSize ' + constraint.minWidth + '-' + constraint.maxWidth + '-' + constraint.minHeight + '-' + constraint.maxHeight);
    console.log('onMeasureSize selfLayoutInfo ' + selfLayoutInfo.width + '-' + selfLayoutInfo.height);
    constraint.minWidth = 20;
    constraint.minHeight = 30;
    console.log('onMeasureSize ' + constraint.minWidth + '-' + constraint.maxWidth + '-' + constraint.minHeight + '-' + constraint.maxHeight);
    children.forEach((child, childIndex) => {
      child.measure(undefined)
    })
    this.result.width = 500;
    this.result.height = 600;
    return this.result;
  }

  build() {
    Column(){
      Text('borderWidth')
      Text('' + this.borderWidthStr)
      Text('Margin')
      Text('' + this.marginStr)
      Text('Padding')
      Text('' + this.paddingStr)
      this.builder()
    }
  }
}
