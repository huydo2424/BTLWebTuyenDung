using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BTLWebTuyenDung
{
    public class Utility
    {

        //tìm kiếm theo tên tag nhập từ bàn phím
        public DataTable search_NameTag(string name_tag)
        {
            DataTable tbl = new DataTable();
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_getSearch_Nametag", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@name_tag", name_tag);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(tbl);
                        return tbl;
                    }

                }
            }
        }
        //show Tag
        public DataView get_Tag()
        {
            DataTable tbl = new DataTable();
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_getTag", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(tbl);
                        return new DataView(tbl);
                    }

                }
            }
        }

        //show DC TD
        public DataView getDC_TD()
        {
            DataTable tbl = new DataTable();
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_getDC_TD", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(tbl);
                        return new DataView(tbl);
                    }

                }
            }
        }
        //show all TD in page TTD
        public DataView getALLTD_pageTTD()
        {
            DataTable tbl = new DataTable();
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_getALLTD_pageTTD", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(tbl);
                        return new DataView(tbl);
                    }

                }
            }
        }


        // get by id Tag -> TTD
        public DataTable getByIdTag(int id)
        {
            DataTable tbl = new DataTable();
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_getSearch_IdTag", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_tag", id);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(tbl);
                        return tbl;
                    }

                }
            }
        }


        //get by id TD
        public DataTable getByID_TD(int id)
        {
            DataTable tbl = new DataTable();
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_getByID_TD", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_TD", id);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(tbl);
                        return tbl;
                    }

                }
            }
        }

        //search theo địa chỉ của tin tuyển dụng
        public DataTable getSearchDC_TD(string Diachi)
        {
            DataTable tbl = new DataTable();
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_getSearchDC_TD", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Diachi", Diachi);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(tbl);
                        return tbl;
                    }

                }
            }
        }

        //add ứng tuyển 
        public void addUngTuyen(int id_User, int id_TD, string Mota, string FileCV)
        {
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_addUngTuyen", conn))
                {
                    conn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_User", id_User);
                    cmd.Parameters.AddWithValue("@id_TD", id_TD);
                    cmd.Parameters.AddWithValue("@Mota", Mota);
                    cmd.Parameters.AddWithValue("@fileCV", FileCV);

                    cmd.ExecuteNonQuery();

                }
            }
        }

        //add tin tuyển dung + tag 
        public int addTinTuyenDung(
            string title,
            int id_user,
            string Mota,
            string yeucau,
            string vitri,
            string mucluong,
            string diachi)
        {
            int id_TD;
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_addTinTuyenDung", conn))
                {
                    conn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@title", title);
                    cmd.Parameters.AddWithValue("@id_user", id_user);
                    cmd.Parameters.AddWithValue("@Mota", Mota);
                    cmd.Parameters.AddWithValue("@yeucau", yeucau);
                    cmd.Parameters.AddWithValue("@vitri", vitri);
                    cmd.Parameters.AddWithValue("@mucluong", mucluong);
                    cmd.Parameters.AddWithValue("@diachi", diachi);


                    cmd.Parameters.Add("@id_TD", SqlDbType.Int, 100);
                    cmd.Parameters["@id_TD"].Direction = ParameterDirection.Output;

                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        id_TD = (int)cmd.Parameters["@id_TD"].Value;
                    }
                    else
                    {
                        id_TD = -1;
                    }

                }
            }
            return id_TD;
        }

        //add tag 
        public int addTag(string Tagname)
        {
            int id_tag;
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_addTag", conn))
                {
                    conn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@name_tag", Tagname);

                    cmd.Parameters.Add("@id_Tag", SqlDbType.Int, 99);
                    cmd.Parameters["@id_Tag"].Direction = ParameterDirection.Output;

                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        id_tag = (int)cmd.Parameters["@id_Tag"].Value;
                    }
                    else
                    {
                        id_tag = -1;
                    }

                }
            }
            return id_tag;
        }

        //add tag_tin
        public Boolean addTag_Tin(int id_TD, int id_tag)
        {
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_addTag_tin", conn))
                {
                    conn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_Tag", id_tag);
                    cmd.Parameters.AddWithValue("@id_TD", id_TD);

                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                }
            }
        }

        //get User theo tên đăng nhập
        public string getByIdUser_role(string username)
        {
            string Role = null;

            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_getUser", conn))
                {
                    conn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@username", username);

                    cmd.Parameters.Add("@Role", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@Role"].Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    Role = (string)cmd.Parameters["@Role"].Value;
                }
            }

            return Role;
        }

        // getbyid User tbl theo tên đăng nhâp
        public DataTable getdUser_username(string name)
        {
            DataTable tbl = new DataTable();
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_getUse_Tendangnhap", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@username", name);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(tbl);
                        return tbl;
                    }

                }
            }
        }
        // get user theo tên user
        public DataTable getbyidUser_ten(string name_user)
        {
            DataTable tbl = new DataTable();
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_getUser_TenUser", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@tenUser", name_user);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(tbl);
                        return tbl;
                    }

                }
            }
        }
        //
        public int getUser_NameUser_idUser(string name_user)
        {
            int id_user;
            string connectStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectStr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_getUser_User_idUser", conn))
                {
                    conn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@username", name_user);

                    cmd.Parameters.Add("@id_user", SqlDbType.Int, 98);
                    cmd.Parameters["@id_user"].Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    id_user = (int)cmd.Parameters["@id_user"].Value;
                }
            }
            return id_user;
        }
    }
}