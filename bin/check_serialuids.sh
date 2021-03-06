#!/bin/sh

#
# Copyright (c) 2012, John Oliver <johno@insightfullogic.com>, Richard Warburton <richard.warburton@gmail.com> All rights reserved.
# 
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.  Oracle designates this
# particular file as subject to the "Classpath" exception as provided
# by Oracle in the LICENSE file that accompanied this code.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

patch_dir=$1
generated_uid_file=$2

grep -oR "serialVersionUID.*" $patch_dir | while read line
do
  file=$(echo $line | cut -d':' -f 1)
  line=$(echo $line | sed 's/.patch//')
  count=$(grep "$line" $generated_uid_file | wc -l)

  if [ $count -lt 1 ]
  then
    echo $line $count
  fi
done
