(* libguestfs generated file
 * WARNING: THIS FILE IS GENERATED BY 'src/generator.ml'.
 * ANY CHANGES YOU MAKE TO THIS FILE WILL BE LOST.
 *
 * Copyright (C) 2009 Red Hat Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 *)

(** For API documentation you should refer to the C API
    in the guestfs(3) manual page.  The OCaml API uses almost
    exactly the same calls. *)

type t
(** A [guestfs_h] handle. *)

exception Error of string
(** This exception is raised when there is an error. *)

val create : unit -> t

val close : t -> unit
(** Handles are closed by the garbage collector when they become
    unreferenced, but callers can also call this in order to
    provide predictable cleanup. *)

type lvm_pv = {
  pv_name : string;
  pv_uuid : string;
  pv_fmt : string;
  pv_size : int64;
  dev_size : int64;
  pv_free : int64;
  pv_used : int64;
  pv_attr : string;
  pv_pe_count : int64;
  pv_pe_alloc_count : int64;
  pv_tags : string;
  pe_start : int64;
  pv_mda_count : int64;
  pv_mda_free : int64;
}

type lvm_vg = {
  vg_name : string;
  vg_uuid : string;
  vg_fmt : string;
  vg_attr : string;
  vg_size : int64;
  vg_free : int64;
  vg_sysid : string;
  vg_extent_size : int64;
  vg_extent_count : int64;
  vg_free_count : int64;
  max_lv : int64;
  max_pv : int64;
  pv_count : int64;
  lv_count : int64;
  snap_count : int64;
  vg_seqno : int64;
  vg_tags : string;
  vg_mda_count : int64;
  vg_mda_free : int64;
}

type lvm_lv = {
  lv_name : string;
  lv_uuid : string;
  lv_attr : string;
  lv_major : int64;
  lv_minor : int64;
  lv_kernel_major : int64;
  lv_kernel_minor : int64;
  lv_size : int64;
  seg_count : int64;
  origin : string;
  snap_percent : float option;
  copy_percent : float option;
  move_pv : string;
  lv_tags : string;
  mirror_log : string;
  modules : string;
}

val launch : t -> unit
(** launch the qemu subprocess *)

val wait_ready : t -> unit
(** wait until the qemu subprocess launches *)

val kill_subprocess : t -> unit
(** kill the qemu subprocess *)

val add_drive : t -> string -> unit
(** add an image to examine or modify *)

val add_cdrom : t -> string -> unit
(** add a CD-ROM disk image to examine *)

val config : t -> string -> string option -> unit
(** add qemu parameters *)

val set_path : t -> string -> unit
(** set the search path *)

val get_path : t -> string
(** get the search path *)

val set_autosync : t -> bool -> unit
(** set autosync mode *)

val get_autosync : t -> bool
(** get autosync mode *)

val set_verbose : t -> bool -> unit
(** set verbose mode *)

val get_verbose : t -> bool
(** get verbose mode *)

val mount : t -> string -> string -> unit
(** mount a guest disk at a position in the filesystem *)

val sync : t -> unit
(** sync disks, writes are flushed through to the disk image *)

val touch : t -> string -> unit
(** update file timestamps or create a new file *)

val cat : t -> string -> string
(** list the contents of a file *)

val ll : t -> string -> string
(** list the files in a directory (long format) *)

val ls : t -> string -> string array
(** list the files in a directory *)

val list_devices : t -> string array
(** list the block devices *)

val list_partitions : t -> string array
(** list the partitions *)

val pvs : t -> string array
(** list the LVM physical volumes (PVs) *)

val vgs : t -> string array
(** list the LVM volume groups (VGs) *)

val lvs : t -> string array
(** list the LVM logical volumes (LVs) *)

val pvs_full : t -> lvm_pv array
(** list the LVM physical volumes (PVs) *)

val vgs_full : t -> lvm_vg array
(** list the LVM volume groups (VGs) *)

val lvs_full : t -> lvm_lv array
(** list the LVM logical volumes (LVs) *)

val read_lines : t -> string -> string array
(** read file as lines *)

