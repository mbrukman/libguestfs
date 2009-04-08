/* libguestfs generated file
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
 */

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <guestfs.h>

#ifndef PRId64
#define PRId64 "lld"
#endif

static SV *
my_newSVll(long long val) {
#ifdef USE_64_BIT_ALL
  return newSViv(val);
#else
  char buf[100];
  int len;
  len = snprintf(buf, 100, "%" PRId64, val);
  return newSVpv(buf, len);
#endif
}

#ifndef PRIu64
#define PRIu64 "llu"
#endif

static SV *
my_newSVull(unsigned long long val) {
#ifdef USE_64_BIT_ALL
  return newSVuv(val);
#else
  char buf[100];
  int len;
  len = snprintf(buf, 100, "%" PRIu64, val);
  return newSVpv(buf, len);
#endif
}

/* XXX Not thread-safe, and in general not safe if the caller is
 * issuing multiple requests in parallel (on different guestfs
 * handles).  We should use the guestfs_h handle passed to the
 * error handle to distinguish these cases.
 */
static char *last_error = NULL;

static void
error_handler (guestfs_h *g,
	       void *data,
	       const char *msg)
{
  if (last_error != NULL) free (last_error);
  last_error = strdup (msg);
}

MODULE = Sys::Guestfs  PACKAGE = Sys::Guestfs

guestfs_h *
_create ()
   CODE:
      RETVAL = guestfs_create ();
      if (!RETVAL)
        croak ("could not create guestfs handle");
      guestfs_set_error_handler (RETVAL, error_handler, NULL);
 OUTPUT:
      RETVAL

void
DESTROY (g)
      guestfs_h *g;
 PPCODE:
      guestfs_close (g);

void
launch (g)
      guestfs_h *g;
 PPCODE:
      if (guestfs_launch (g) == -1)
        croak ("launch: %s", last_error);

void
wait_ready (g)
      guestfs_h *g;
 PPCODE:
      if (guestfs_wait_ready (g) == -1)
        croak ("wait_ready: %s", last_error);

void
kill_subprocess (g)
      guestfs_h *g;
 PPCODE:
      if (guestfs_kill_subprocess (g) == -1)
        croak ("kill_subprocess: %s", last_error);

void
add_drive (g, filename)
      guestfs_h *g;
      char *filename;
 PPCODE:
      if (guestfs_add_drive (g, filename) == -1)
        croak ("add_drive: %s", last_error);

void
add_cdrom (g, filename)
      guestfs_h *g;
      char *filename;
 PPCODE:
      if (guestfs_add_cdrom (g, filename) == -1)
        croak ("add_cdrom: %s", last_error);

void
config (g, qemuparam, qemuvalue)
      guestfs_h *g;
      char *qemuparam;
      char *qemuvalue;
 PPCODE:
      if (guestfs_config (g, qemuparam, qemuvalue) == -1)
        croak ("config: %s", last_error);

void
set_path (g, path)
      guestfs_h *g;
      char *path;
 PPCODE:
      if (guestfs_set_path (g, path) == -1)
        croak ("set_path: %s", last_error);

SV *
get_path (g)
      guestfs_h *g;
PREINIT:
      const char *path;
   CODE:
      path = guestfs_get_path (g);
      if (path == NULL)
        croak ("get_path: %s", last_error);
      RETVAL = newSVpv (path, 0);
 OUTPUT:
      RETVAL

void
set_autosync (g, autosync)
      guestfs_h *g;
      int autosync;
 PPCODE:
      if (guestfs_set_autosync (g, autosync) == -1)
        croak ("set_autosync: %s", last_error);

SV *
get_autosync (g)
      guestfs_h *g;
PREINIT:
      int autosync;
   CODE:
      autosync = guestfs_get_autosync (g);
      if (autosync == -1)
        croak ("get_autosync: %s", last_error);
      RETVAL = newSViv (autosync);
 OUTPUT:
      RETVAL

void
set_verbose (g, verbose)
      guestfs_h *g;
      int verbose;
 PPCODE:
      if (guestfs_set_verbose (g, verbose) == -1)
        croak ("set_verbose: %s", last_error);

SV *
get_verbose (g)
      guestfs_h *g;
PREINIT:
      int verbose;
   CODE:
      verbose = guestfs_get_verbose (g);
      if (verbose == -1)
        croak ("get_verbose: %s", last_error);
      RETVAL = newSViv (verbose);
 OUTPUT:
      RETVAL

void
mount (g, device, mountpoint)
      guestfs_h *g;
      char *device;
      char *mountpoint;
 PPCODE:
      if (guestfs_mount (g, device, mountpoint) == -1)
        croak ("mount: %s", last_error);

void
sync (g)
      guestfs_h *g;
 PPCODE:
      if (guestfs_sync (g) == -1)
        croak ("sync: %s", last_error);

void
touch (g, path)
      guestfs_h *g;
      char *path;
 PPCODE:
      if (guestfs_touch (g, path) == -1)
        croak ("touch: %s", last_error);

SV *
cat (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      char *content;
   CODE:
      content = guestfs_cat (g, path);
      if (content == NULL)
        croak ("cat: %s", last_error);
      RETVAL = newSVpv (content, 0);
      free (content);
 OUTPUT:
      RETVAL

SV *
ll (g, directory)
      guestfs_h *g;
      char *directory;
PREINIT:
      char *listing;
   CODE:
      listing = guestfs_ll (g, directory);
      if (listing == NULL)
        croak ("ll: %s", last_error);
      RETVAL = newSVpv (listing, 0);
      free (listing);
 OUTPUT:
      RETVAL

void
ls (g, directory)
      guestfs_h *g;
      char *directory;
PREINIT:
      char **listing;
      int i, n;
 PPCODE:
      listing = guestfs_ls (g, directory);
      if (listing == NULL)
        croak ("ls: %s", last_error);
      for (n = 0; listing[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (listing[i], 0)));
        free (listing[i]);
      }
      free (listing);

void
list_devices (g)
      guestfs_h *g;
PREINIT:
      char **devices;
      int i, n;
 PPCODE:
      devices = guestfs_list_devices (g);
      if (devices == NULL)
        croak ("list_devices: %s", last_error);
      for (n = 0; devices[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (devices[i], 0)));
        free (devices[i]);
      }
      free (devices);

void
list_partitions (g)
      guestfs_h *g;
PREINIT:
      char **partitions;
      int i, n;
 PPCODE:
      partitions = guestfs_list_partitions (g);
      if (partitions == NULL)
        croak ("list_partitions: %s", last_error);
      for (n = 0; partitions[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (partitions[i], 0)));
        free (partitions[i]);
      }
      free (partitions);

void
pvs (g)
      guestfs_h *g;
PREINIT:
      char **physvols;
      int i, n;
 PPCODE:
      physvols = guestfs_pvs (g);
      if (physvols == NULL)
        croak ("pvs: %s", last_error);
      for (n = 0; physvols[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (physvols[i], 0)));
        free (physvols[i]);
      }
      free (physvols);

void
vgs (g)
      guestfs_h *g;
PREINIT:
      char **volgroups;
      int i, n;
 PPCODE:
      volgroups = guestfs_vgs (g);
      if (volgroups == NULL)
        croak ("vgs: %s", last_error);
      for (n = 0; volgroups[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (volgroups[i], 0)));
        free (volgroups[i]);
      }
      free (volgroups);

void
lvs (g)
      guestfs_h *g;
PREINIT:
      char **logvols;
      int i, n;
 PPCODE:
      logvols = guestfs_lvs (g);
      if (logvols == NULL)
        croak ("lvs: %s", last_error);
      for (n = 0; logvols[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (logvols[i], 0)));
        free (logvols[i]);
      }
      free (logvols);

void
pvs_full (g)
      guestfs_h *g;
PREINIT:
      struct guestfs_lvm_pv_list *physvols;
      int i;
      HV *hv;
 PPCODE:
      physvols = guestfs_pvs_full (g);
      if (physvols == NULL)
        croak ("pvs_full: %s", last_error);
      EXTEND (SP, physvols->len);
      for (i = 0; i < physvols->len; ++i) {
        hv = newHV ();
        (void) hv_store (hv, "pv_name", 7, newSVpv (physvols->val[i].pv_name, 0), 0);
        (void) hv_store (hv, "pv_uuid", 7, newSVpv (physvols->val[i].pv_uuid, 32), 0);
        (void) hv_store (hv, "pv_fmt", 6, newSVpv (physvols->val[i].pv_fmt, 0), 0);
        (void) hv_store (hv, "pv_size", 7, my_newSVull (physvols->val[i].pv_size), 0);
        (void) hv_store (hv, "dev_size", 8, my_newSVull (physvols->val[i].dev_size), 0);
        (void) hv_store (hv, "pv_free", 7, my_newSVull (physvols->val[i].pv_free), 0);
        (void) hv_store (hv, "pv_used", 7, my_newSVull (physvols->val[i].pv_used), 0);
        (void) hv_store (hv, "pv_attr", 7, newSVpv (physvols->val[i].pv_attr, 0), 0);
        (void) hv_store (hv, "pv_pe_count", 11, my_newSVll (physvols->val[i].pv_pe_count), 0);
        (void) hv_store (hv, "pv_pe_alloc_count", 17, my_newSVll (physvols->val[i].pv_pe_alloc_count), 0);
        (void) hv_store (hv, "pv_tags", 7, newSVpv (physvols->val[i].pv_tags, 0), 0);
        (void) hv_store (hv, "pe_start", 8, my_newSVull (physvols->val[i].pe_start), 0);
        (void) hv_store (hv, "pv_mda_count", 12, my_newSVll (physvols->val[i].pv_mda_count), 0);
        (void) hv_store (hv, "pv_mda_free", 11, my_newSVull (physvols->val[i].pv_mda_free), 0);
        PUSHs (sv_2mortal ((SV *) hv));
      }
      guestfs_free_lvm_pv_list (physvols);

void
vgs_full (g)
      guestfs_h *g;
PREINIT:
      struct guestfs_lvm_vg_list *volgroups;
      int i;
      HV *hv;
 PPCODE:
      volgroups = guestfs_vgs_full (g);
      if (volgroups == NULL)
        croak ("vgs_full: %s", last_error);
      EXTEND (SP, volgroups->len);
      for (i = 0; i < volgroups->len; ++i) {
        hv = newHV ();
        (void) hv_store (hv, "vg_name", 7, newSVpv (volgroups->val[i].vg_name, 0), 0);
        (void) hv_store (hv, "vg_uuid", 7, newSVpv (volgroups->val[i].vg_uuid, 32), 0);
        (void) hv_store (hv, "vg_fmt", 6, newSVpv (volgroups->val[i].vg_fmt, 0), 0);
        (void) hv_store (hv, "vg_attr", 7, newSVpv (volgroups->val[i].vg_attr, 0), 0);
        (void) hv_store (hv, "vg_size", 7, my_newSVull (volgroups->val[i].vg_size), 0);
        (void) hv_store (hv, "vg_free", 7, my_newSVull (volgroups->val[i].vg_free), 0);
        (void) hv_store (hv, "vg_sysid", 8, newSVpv (volgroups->val[i].vg_sysid, 0), 0);
        (void) hv_store (hv, "vg_extent_size", 14, my_newSVull (volgroups->val[i].vg_extent_size), 0);
        (void) hv_store (hv, "vg_extent_count", 15, my_newSVll (volgroups->val[i].vg_extent_count), 0);
        (void) hv_store (hv, "vg_free_count", 13, my_newSVll (volgroups->val[i].vg_free_count), 0);
        (void) hv_store (hv, "max_lv", 6, my_newSVll (volgroups->val[i].max_lv), 0);
        (void) hv_store (hv, "max_pv", 6, my_newSVll (volgroups->val[i].max_pv), 0);
        (void) hv_store (hv, "pv_count", 8, my_newSVll (volgroups->val[i].pv_count), 0);
        (void) hv_store (hv, "lv_count", 8, my_newSVll (volgroups->val[i].lv_count), 0);
        (void) hv_store (hv, "snap_count", 10, my_newSVll (volgroups->val[i].snap_count), 0);
        (void) hv_store (hv, "vg_seqno", 8, my_newSVll (volgroups->val[i].vg_seqno), 0);
        (void) hv_store (hv, "vg_tags", 7, newSVpv (volgroups->val[i].vg_tags, 0), 0);
        (void) hv_store (hv, "vg_mda_count", 12, my_newSVll (volgroups->val[i].vg_mda_count), 0);
        (void) hv_store (hv, "vg_mda_free", 11, my_newSVull (volgroups->val[i].vg_mda_free), 0);
        PUSHs (sv_2mortal ((SV *) hv));
      }
      guestfs_free_lvm_vg_list (volgroups);

void
lvs_full (g)
      guestfs_h *g;
PREINIT:
      struct guestfs_lvm_lv_list *logvols;
      int i;
      HV *hv;
 PPCODE:
      logvols = guestfs_lvs_full (g);
      if (logvols == NULL)
        croak ("lvs_full: %s", last_error);
      EXTEND (SP, logvols->len);
      for (i = 0; i < logvols->len; ++i) {
        hv = newHV ();
        (void) hv_store (hv, "lv_name", 7, newSVpv (logvols->val[i].lv_name, 0), 0);
        (void) hv_store (hv, "lv_uuid", 7, newSVpv (logvols->val[i].lv_uuid, 32), 0);
        (void) hv_store (hv, "lv_attr", 7, newSVpv (logvols->val[i].lv_attr, 0), 0);
        (void) hv_store (hv, "lv_major", 8, my_newSVll (logvols->val[i].lv_major), 0);
        (void) hv_store (hv, "lv_minor", 8, my_newSVll (logvols->val[i].lv_minor), 0);
        (void) hv_store (hv, "lv_kernel_major", 15, my_newSVll (logvols->val[i].lv_kernel_major), 0);
        (void) hv_store (hv, "lv_kernel_minor", 15, my_newSVll (logvols->val[i].lv_kernel_minor), 0);
        (void) hv_store (hv, "lv_size", 7, my_newSVull (logvols->val[i].lv_size), 0);
        (void) hv_store (hv, "seg_count", 9, my_newSVll (logvols->val[i].seg_count), 0);
        (void) hv_store (hv, "origin", 6, newSVpv (logvols->val[i].origin, 0), 0);
        (void) hv_store (hv, "snap_percent", 12, newSVnv (logvols->val[i].snap_percent), 0);
        (void) hv_store (hv, "copy_percent", 12, newSVnv (logvols->val[i].copy_percent), 0);
        (void) hv_store (hv, "move_pv", 7, newSVpv (logvols->val[i].move_pv, 0), 0);
        (void) hv_store (hv, "lv_tags", 7, newSVpv (logvols->val[i].lv_tags, 0), 0);
        (void) hv_store (hv, "mirror_log", 10, newSVpv (logvols->val[i].mirror_log, 0), 0);
        (void) hv_store (hv, "modules", 7, newSVpv (logvols->val[i].modules, 0), 0);
        PUSHs (sv_2mortal ((SV *) hv));
      }
      guestfs_free_lvm_lv_list (logvols);

void
read_lines (g, path)
      guestfs_h *g;
      char *path;
PREINIT:
      char **lines;
      int i, n;
 PPCODE:
      lines = guestfs_read_lines (g, path);
      if (lines == NULL)
        croak ("read_lines: %s", last_error);
      for (n = 0; lines[n] != NULL; ++n) /**/;
      EXTEND (SP, n);
      for (i = 0; i < n; ++i) {
        PUSHs (sv_2mortal (newSVpv (lines[i], 0)));
        free (lines[i]);
      }
      free (lines);

