/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#include "guestfs_protocol.h"

bool_t
xdr_str (XDR *xdrs, str *objp)
{
	register int32_t *buf;

	 if (!xdr_string (xdrs, objp, ~0))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_lvm_int_pv (XDR *xdrs, guestfs_lvm_int_pv *objp)
{
	register int32_t *buf;

	int i;
	 if (!xdr_string (xdrs, &objp->pv_name, ~0))
		 return FALSE;
	 if (!xdr_opaque (xdrs, objp->pv_uuid, 32))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->pv_fmt, ~0))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->pv_size))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->dev_size))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->pv_free))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->pv_used))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->pv_attr, ~0))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->pv_pe_count))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->pv_pe_alloc_count))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->pv_tags, ~0))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->pe_start))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->pv_mda_count))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->pv_mda_free))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_lvm_int_pv_list (XDR *xdrs, guestfs_lvm_int_pv_list *objp)
{
	register int32_t *buf;

	 if (!xdr_array (xdrs, (char **)&objp->guestfs_lvm_int_pv_list_val, (u_int *) &objp->guestfs_lvm_int_pv_list_len, ~0,
		sizeof (guestfs_lvm_int_pv), (xdrproc_t) xdr_guestfs_lvm_int_pv))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_lvm_int_vg (XDR *xdrs, guestfs_lvm_int_vg *objp)
{
	register int32_t *buf;

	int i;
	 if (!xdr_string (xdrs, &objp->vg_name, ~0))
		 return FALSE;
	 if (!xdr_opaque (xdrs, objp->vg_uuid, 32))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->vg_fmt, ~0))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->vg_attr, ~0))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->vg_size))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->vg_free))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->vg_sysid, ~0))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->vg_extent_size))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->vg_extent_count))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->vg_free_count))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->max_lv))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->max_pv))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->pv_count))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->lv_count))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->snap_count))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->vg_seqno))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->vg_tags, ~0))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->vg_mda_count))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->vg_mda_free))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_lvm_int_vg_list (XDR *xdrs, guestfs_lvm_int_vg_list *objp)
{
	register int32_t *buf;

	 if (!xdr_array (xdrs, (char **)&objp->guestfs_lvm_int_vg_list_val, (u_int *) &objp->guestfs_lvm_int_vg_list_len, ~0,
		sizeof (guestfs_lvm_int_vg), (xdrproc_t) xdr_guestfs_lvm_int_vg))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_lvm_int_lv (XDR *xdrs, guestfs_lvm_int_lv *objp)
{
	register int32_t *buf;

	int i;
	 if (!xdr_string (xdrs, &objp->lv_name, ~0))
		 return FALSE;
	 if (!xdr_opaque (xdrs, objp->lv_uuid, 32))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->lv_attr, ~0))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->lv_major))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->lv_minor))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->lv_kernel_major))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->lv_kernel_minor))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->lv_size))
		 return FALSE;
	 if (!xdr_quad_t (xdrs, &objp->seg_count))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->origin, ~0))
		 return FALSE;
	 if (!xdr_float (xdrs, &objp->snap_percent))
		 return FALSE;
	 if (!xdr_float (xdrs, &objp->copy_percent))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->move_pv, ~0))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->lv_tags, ~0))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->mirror_log, ~0))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->modules, ~0))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_lvm_int_lv_list (XDR *xdrs, guestfs_lvm_int_lv_list *objp)
{
	register int32_t *buf;

	 if (!xdr_array (xdrs, (char **)&objp->guestfs_lvm_int_lv_list_val, (u_int *) &objp->guestfs_lvm_int_lv_list_len, ~0,
		sizeof (guestfs_lvm_int_lv), (xdrproc_t) xdr_guestfs_lvm_int_lv))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_mount_args (XDR *xdrs, guestfs_mount_args *objp)
{
	register int32_t *buf;

	 if (!xdr_string (xdrs, &objp->device, ~0))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->mountpoint, ~0))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_touch_args (XDR *xdrs, guestfs_touch_args *objp)
{
	register int32_t *buf;

	 if (!xdr_string (xdrs, &objp->path, ~0))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_cat_args (XDR *xdrs, guestfs_cat_args *objp)
{
	register int32_t *buf;

	 if (!xdr_string (xdrs, &objp->path, ~0))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_cat_ret (XDR *xdrs, guestfs_cat_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_string (xdrs, &objp->content, ~0))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_ll_args (XDR *xdrs, guestfs_ll_args *objp)
{
	register int32_t *buf;

	 if (!xdr_string (xdrs, &objp->directory, ~0))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_ll_ret (XDR *xdrs, guestfs_ll_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_string (xdrs, &objp->listing, ~0))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_ls_args (XDR *xdrs, guestfs_ls_args *objp)
{
	register int32_t *buf;

	 if (!xdr_string (xdrs, &objp->directory, ~0))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_ls_ret (XDR *xdrs, guestfs_ls_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_array (xdrs, (char **)&objp->listing.listing_val, (u_int *) &objp->listing.listing_len, ~0,
		sizeof (str), (xdrproc_t) xdr_str))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_list_devices_ret (XDR *xdrs, guestfs_list_devices_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_array (xdrs, (char **)&objp->devices.devices_val, (u_int *) &objp->devices.devices_len, ~0,
		sizeof (str), (xdrproc_t) xdr_str))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_list_partitions_ret (XDR *xdrs, guestfs_list_partitions_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_array (xdrs, (char **)&objp->partitions.partitions_val, (u_int *) &objp->partitions.partitions_len, ~0,
		sizeof (str), (xdrproc_t) xdr_str))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_pvs_ret (XDR *xdrs, guestfs_pvs_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_array (xdrs, (char **)&objp->physvols.physvols_val, (u_int *) &objp->physvols.physvols_len, ~0,
		sizeof (str), (xdrproc_t) xdr_str))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_vgs_ret (XDR *xdrs, guestfs_vgs_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_array (xdrs, (char **)&objp->volgroups.volgroups_val, (u_int *) &objp->volgroups.volgroups_len, ~0,
		sizeof (str), (xdrproc_t) xdr_str))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_lvs_ret (XDR *xdrs, guestfs_lvs_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_array (xdrs, (char **)&objp->logvols.logvols_val, (u_int *) &objp->logvols.logvols_len, ~0,
		sizeof (str), (xdrproc_t) xdr_str))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_pvs_full_ret (XDR *xdrs, guestfs_pvs_full_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_guestfs_lvm_int_pv_list (xdrs, &objp->physvols))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_vgs_full_ret (XDR *xdrs, guestfs_vgs_full_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_guestfs_lvm_int_vg_list (xdrs, &objp->volgroups))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_lvs_full_ret (XDR *xdrs, guestfs_lvs_full_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_guestfs_lvm_int_lv_list (xdrs, &objp->logvols))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_read_lines_args (XDR *xdrs, guestfs_read_lines_args *objp)
{
	register int32_t *buf;

	 if (!xdr_string (xdrs, &objp->path, ~0))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_read_lines_ret (XDR *xdrs, guestfs_read_lines_ret *objp)
{
	register int32_t *buf;

	 if (!xdr_array (xdrs, (char **)&objp->lines.lines_val, (u_int *) &objp->lines.lines_len, ~0,
		sizeof (str), (xdrproc_t) xdr_str))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_procedure (XDR *xdrs, guestfs_procedure *objp)
{
	register int32_t *buf;

	 if (!xdr_enum (xdrs, (enum_t *) objp))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_message_direction (XDR *xdrs, guestfs_message_direction *objp)
{
	register int32_t *buf;

	 if (!xdr_enum (xdrs, (enum_t *) objp))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_message_status (XDR *xdrs, guestfs_message_status *objp)
{
	register int32_t *buf;

	 if (!xdr_enum (xdrs, (enum_t *) objp))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_message_error (XDR *xdrs, guestfs_message_error *objp)
{
	register int32_t *buf;

	 if (!xdr_string (xdrs, &objp->error, GUESTFS_ERROR_LEN))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_guestfs_message_header (XDR *xdrs, guestfs_message_header *objp)
{
	register int32_t *buf;

	 if (!xdr_u_int (xdrs, &objp->prog))
		 return FALSE;
	 if (!xdr_u_int (xdrs, &objp->vers))
		 return FALSE;
	 if (!xdr_guestfs_procedure (xdrs, &objp->proc))
		 return FALSE;
	 if (!xdr_guestfs_message_direction (xdrs, &objp->direction))
		 return FALSE;
	 if (!xdr_u_int (xdrs, &objp->serial))
		 return FALSE;
	 if (!xdr_guestfs_message_status (xdrs, &objp->status))
		 return FALSE;
	return TRUE;
}
