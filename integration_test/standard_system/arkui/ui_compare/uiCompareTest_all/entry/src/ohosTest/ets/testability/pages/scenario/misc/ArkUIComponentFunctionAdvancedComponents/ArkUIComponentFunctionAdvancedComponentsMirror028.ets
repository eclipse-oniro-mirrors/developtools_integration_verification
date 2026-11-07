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

import { Chip, ChipSize } from '@kit.ArkUI';

@Entry
@Component
struct ArkUIComponentFunctionAdvancedComponentsMirror028 {
  build() {
    Column({ space: 10 }) {
      Chip({
        prefixIcon: {
          src: $r('app.media.ic_public_delete'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red
        },
        label: {
          text: 'operate',
          fontSize: 12,
          fontColor: Color.Blue,
          labelMargin: { left: 20, right: 30 }
        },
        suffixIcon: {
          src: $r('app.media.ic_public_delete_filled'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red
        },
        direction: Direction.Ltr,
        size: ChipSize.NORMAL,
        allowClose: false,
        enabled: true,
        backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
        borderRadius: $r('sys.float.ohos_id_corner_radius_button')
      })
    }
  }
}
